import json
import re
import os
import random

RAW_JSON = "data/raw_characters.json"
SQL_IMPORT_FILE = "db/import_silly_cats.sql"
SQL_MAIN_FILE = "db/pet_adoption.sql"

# Expanded Breeds List
BREEDS = [
    (1, 'Pug', 1),
    (2, 'Persian', 2),
    (3, 'Parrot', 3),
    (4, 'Maine Coon', 2),
    (5, 'Tabby', 2),
    (6, 'Domestic Shorthair', 2),
    (7, 'Siamese', 2),
    (8, 'Sphynx', 2),
    (9, 'Ragdoll', 2),
    (10, 'British Shorthair', 2),
    (11, 'Bengal', 2),
    (12, 'Scottish Fold', 2),
    (13, 'Tuxedo', 2),
    (14, 'Calico', 2),
    (15, 'Silly Shorthair', 2),
    (16, 'Gnaplian Tabby', 2),
]

OPENING_HOOKS = [
    "Introducing {name}, an absolute sweetheart with a big heart and a unique charm!",
    "Say hello to {name}! This wonderful feline is searching for a loving home.",
    "Meet {name}, a one-of-a-kind companion ready to bring endless joy to your family.",
    "{name} is a truly unforgettable pet looking for a comfy couch and a caring owner.",
    "Looking for a cuddle buddy? {name} might just be your perfect match!",
    "Give a warm welcome to {name}, an adventurous and spirited friend.",
    "{name} is ready to make your house feel like home.",
    "If you're seeking a loyal and affectionate partner, look no further than {name}.",
    "Meet {name}! Blessed with a colorful personality and endless charm.",
    "{name} has arrived at the shelter and is eager to meet their new best friend.",
    "With a majestic presence and a gentle heart, {name} is waiting for you.",
    "Say hi to {name}, a delightful pet who loves making new friends.",
    "{name} is a precious soul ready for their next big chapter in a forever home.",
    "Ready to open your heart? {name} is waiting to meet their forever family.",
    "{name} is an extraordinary pet with a story to tell and plenty of love to give.",
    "Meet the wonderful {name}! A curious and lovable companion looking for adoption."
]

CLOSING_CTAS = [
    "Is {name} the furry friend you've been searching for? Apply to adopt today!",
    "{name} would love to meet you—schedule a visit and fall in love!",
    "Come say hello to {name} and give this special pet the loving home they deserve.",
    "Ready to welcome {name} into your life? Contact our adoption team now.",
    "{name} is up to date on vaccinations and ready to head home with you!",
    "Don't miss the chance to bring {name} home—fill out an adoption inquiry today.",
    "{name} is dreaming of a cozy lap and plenty of treats in a quiet, loving home.",
    "Could {name} be the missing piece in your family? Come meet them today!",
    "Give {name} the fresh start they've been waiting for!",
    "{name} is ready to start their next chapter with a devoted family."
]

BEHAVIOR_PRESETS = [
    "Playful, energetic, and loves interactive toys.",
    "Gentle, quiet, and enjoys lounging in sunny spots.",
    "Affectionate, purr-heavy cuddlebug who loves head scratches.",
    "Curious, alert, and always exploring their surroundings.",
    "Spirited, independent, but very loving with their favorite human.",
    "Mellow, relaxed, and great with cozy lap naps.",
    "Social, confident, and eager to welcome visitors.",
    "Sweet-tempered, loyal, and thrives in a peaceful environment."
]

# Explicit inappropriate terms for PRUNING characters
PRUNE_TERMS = [
    r'\bnazi\b', r'\bkitler\b', r'\bhitler\b', r'\bracist\b', r'\bterrorist\b',
    r'\bprostitute\b', r'\bporn\b', r'\bsex\b', r'\bcock\b', r'\bdick\b', r'\bpussy\b',
    r'\bshit\b', r'\bfuck\b', r'\bbitch\b', r'\bcunt\b', r'\bnigger\b', r'\bnigga\b',
    r'\bfag\b', r'\bfaggot\b', r'\bretard\b', r'\bwhore\b', r'\bslut\b',
    r'\bdrug smuggler\b', r'\bdrug dealer\b', r'\bmurderer\b', r'\bdoo doo fart\b',
    r'\bbig poo\b', r'\bmr\. poo\b', r'\bpoop\b', r'\bfart\b'
]

BAD_TITLE_WORDS = ['kitler', 'racist', 'terrorist', 'poo', 'fart', 'cuhai', '832', '$24.50', '🐱', 'archive', '! delete', 'zoom zinger', 'zingus']

# FACT group members (exempt from 'not silly' pruning)
FACT_GROUP_NAMES = ['cokey cola', 'dr pebba', 'dr peppy', 'fanter', 'monsert', 'pepsie', 'poncky', 'prongles', 'roobeer', 'spirte']

def is_fact_member(character):
    title_lower = character['title'].lower()
    if title_lower in FACT_GROUP_NAMES:
        return True
    affiliation = str(character.get('infobox', {}).get('affiliation', '')).lower()
    if 'fact' in affiliation or 'f.a.c.t' in affiliation:
        return True
    return False

def should_prune(character):
    title = character['title']
    wikitext = character.get('wikitext', '').lower()
    raw_text = character.get('raw_text', '').lower()
    full_text = f'{title} {wikitext} {raw_text}'
    
    # Check title explicitly
    title_lower = title.lower()
    if any(tw in title_lower for tw in BAD_TITLE_WORDS) or title.startswith('$') or (title.startswith('"') and title.endswith('"')):
        return True, 'Inappropriate or non-character title'
        
    # Check for disallowed NSFW / hate / drug / violence terms
    for pat in PRUNE_TERMS:
        if re.search(pat, full_text):
            return True, f'Matched disallowed term: {pat}'
            
    # Check meta banners IF NOT A FACT GROUP MEMBER
    if not is_fact_member(character):
        if 'this article is not silly' in raw_text or 'this article is not silly' in wikitext:
            return True, 'Not silly notice banner'
        if 'shipwreck' in raw_text or 'shipwreck' in wikitext:
            return True, 'Shipwreck low quality notice'
        if 'how (not) to guide' in raw_text or 'character template' in raw_text:
            return True, 'Guide template'
            
    # Content too short
    cleaned = clean_wiki_text(raw_text)
    if len(cleaned.split()) < 4 and len(wikitext) < 80:
        return True, "Content too short"
        
    return False, None

def clean_wiki_text(text):
    if not text:
        return ""
    # Strip wikitext markup and templates
    text = re.sub(r'\{\{wave\|(.*?)\}\}', lambda m: ''.join(m.group(1).split('|')), text, flags=re.IGNORECASE)
    text = re.sub(r'\{\{[^}]+\}\}', '', text)
    text = re.sub(r'\[\[Category:[^\]]+\]\]', '', text)
    text = re.sub(r'\[\[File:[^\]]+\]\]', '', text)
    text = re.sub(r'\[\[(?:[^|\]]*\|)?([^\]]+)\]\]', r'\1', text)
    text = re.sub(r'==+[^=]+=+', '', text)
    
    # Strip common wiki header banners and notices
    banners = [
        r'This article has moved to another wiki\.?',
        r'This article has moved to a new wiki \.?',
        r'This article lacks information, you can help make it silly by expanding it !?',
        r'This article is NOT silly!?',
        r'Work In Progress\s+[A-Za-z0-9_]+ was last revised by [^\n\.]+\.?',
        r'Work In Progress',
        r'This page is a shipwreck \.?',
        r'This article will not be moved to future wikis due to low quality writing[^\.]*\.?',
        r'This article does not meet this wiki Manual of Style[^\.]*\.?',
        r'Reason: Below 72dpi[^\.]*\.?',
        r'Failing to meet the requirement for 10 days will result a page deletiton\.?',
        r'How \(not\) to Guide: Character Template[^\.]*\.?',
        r'For full details check Manual of Style \.?',
        r'It is recommended to use Visual Editor[^\.]*\.?',
        r'Biographical Information',
        r'Social Media Instagram [^\s]+',
        r'TikTok YouTube [^\s]+',
        r'Status Alive',
        r'Status Deceased',
        r'Status Unknown',
        r'Nationality [^\s]+',
        r'Aliases [^\n]*',
        r'Relatives [^\n]*',
        r'Farewell,[^\.]*passed away[^\.]*\.?'
    ]
    for b in banners:
        text = re.sub(b, '', text, flags=re.IGNORECASE)
        
    text = re.sub(r'\"[^\"]*\"', '', text) # Remove infobox image captions in quotes
    
    # Sanitize violent/inappropriate words leftover in body text
    sanitize_words = [
        r'\b(gun|glock|pistol|rifle|weapon|bomb|explosive|grenade|shooting|murder|killed|killing|deadly|firefight|war|terrorist|drug|smuggler|nazi|hitler)\b'
    ]
    for sw in sanitize_words:
        text = re.sub(sw, '', text, flags=re.IGNORECASE)
        
    text = re.sub(r'\s+', ' ', text).strip()
    return text

def escape_sql(text):
    if text is None:
        return "NULL"
    escaped = text.replace("\\", "\\\\").replace("'", "''").replace("\r", "").replace("\n", "\\n")
    return f"'{escaped}'"

def determine_breed_id(animal_type_id, title, infobox, raw_text):
    if animal_type_id == 1:
        return 1 # Pug / Dog default
    if animal_type_id == 3:
        return 3 # Parrot / Bird default
        
    text_lower = (title + " " + json.dumps(infobox) + " " + raw_text[:400]).lower()
    
    if 'sphynx' in text_lower or 'hairless' in text_lower or 'bingus' in text_lower:
        return 8 # Sphynx
    if 'caracal' in text_lower or 'floppa' in text_lower or 'bengal' in text_lower:
        return 11 # Bengal
    if 'gnarp' in text_lower or 'alien' in text_lower or 'k.i.t.y' in text_lower:
        return 16 # Gnaplian Tabby
    if 'tabby' in text_lower:
        return 5 # Tabby
    if 'persian' in text_lower or 'fluffy' in text_lower:
        return 2 # Persian
    if 'maine coon' in text_lower or 'big' in text_lower:
        return 4 # Maine Coon
    if 'tuxedo' in text_lower or 'black' in text_lower:
        return 13 # Tuxedo
    if 'calico' in text_lower or 'orange' in text_lower:
        return 14 # Calico
    if 'siamese' in text_lower:
        return 7 # Siamese
        
    cat_breed_ids = [2, 4, 5, 6, 7, 9, 10, 12, 13, 14, 15]
    h = sum(ord(c) for c in title)
    return cat_breed_ids[h % len(cat_breed_ids)]

def sanitize_occupation(occ):
    if not occ:
        return None
    occ_lower = occ.lower()
    bad_occ_keywords = ['drug', 'smuggler', 'evil', 'b.a.d', 'fighting', 'snake charmer', 'harborer', 'murder', 'killer', 'enemy']
    if any(k in occ_lower for k in bad_occ_keywords):
        return "Community Companion"
    return occ.strip()

def generate_dynamic_description(idx, title, infobox, raw_text):
    cleaned = clean_wiki_text(raw_text)
    
    hook = OPENING_HOOKS[idx % len(OPENING_HOOKS)].format(name=title)
    cta = CLOSING_CTAS[(idx * 3) % len(CLOSING_CTAS)].format(name=title)
    
    body_paragraphs = []
    
    if cleaned and len(cleaned) > 15:
        sentences = [s.strip() for s in re.split(r'(?<=[.!?])\s+', cleaned) if len(s.strip()) > 10]
        if sentences:
            body_paragraphs.append(" ".join(sentences[:3]))
            
    occupation = sanitize_occupation(infobox.get('occupation', '').replace('<br>', ', '))
    affiliation = infobox.get('affiliation', '').replace('<br>', ', ').strip()
    fur = infobox.get('fur', '').strip()
    
    details = []
    if occupation and occupation.lower() not in ['none', 'unknown']:
        details.append(f"In their spare time, {title} enjoys staying busy with work as a {occupation}.")
    if affiliation and affiliation.lower() not in ['none', 'unknown'] and not any(b in affiliation.lower() for b in ['evil', 'b.a.d', 'drug']):
        details.append(f"They are a proud member of {affiliation}.")
    if fur and fur.lower() not in ['none', 'unknown']:
        details.append(f"They sport a striking {fur} coat.")
        
    if details:
        body_paragraphs.append(" ".join(details))
        
    if not body_paragraphs:
        body_paragraphs.append(f"{title} is a sweet, playful cat looking for a warm and comfortable home to settle down in.")
        
    full_desc = f"{hook}\n\n" + "\n\n".join(body_paragraphs) + f"\n\n{cta}"
    return full_desc

def generate_dynamic_behavior(idx, title, infobox, raw_text):
    text_lower = (title + " " + json.dumps(infobox) + " " + raw_text[:300]).lower()
    
    traits = []
    if 'kind' in text_lower or 'altruistic' in text_lower or 'good' in text_lower or 'hero' in text_lower:
        traits.extend(['Gentle-natured', 'Kind-hearted', 'Affectionate'])
    elif 'leader' in text_lower or 'boss' in text_lower or 'charismatic' in text_lower:
        traits.extend(['Charismatic', 'Confident', 'Leader'])
    elif 'eeper' in text_lower or 'sleep' in text_lower or 'snoozer' in text_lower or 'mimir' in text_lower:
        traits.extend(['Sleepy', 'Cuddly', 'Mellow'])
    elif 'silly' in text_lower or 'goofy' in text_lower or 'boingus' in text_lower:
        traits.extend(['Playful', 'Goofy', 'High-energy'])
    else:
        preset = BEHAVIOR_PRESETS[idx % len(BEHAVIOR_PRESETS)]
        return preset

    res = ", ".join(traits)
    occ = sanitize_occupation(infobox.get('occupation'))
    if occ and occ.lower() not in ['none', 'unknown']:
        res += f" ({occ})"
    if len(res) > 190:
        res = res[:187] + "..."
    return res

def main():
    if not os.path.exists(RAW_JSON):
        print(f"Error: {RAW_JSON} does not exist.")
        return
        
    with open(RAW_JSON, "r", encoding="utf-8") as f:
        characters = json.load(f)
        
    print(f"Loaded {len(characters)} raw character entries. Processing FACT exemptions & generating data...")
    
    pet_rows = []
    pruned_count = 0
    pet_id = 1
    
    for c in characters:
        prune, reason = should_prune(c)
        if prune:
            pruned_count += 1
            continue
            
        title = c['title']
        infobox = c.get('infobox', {})
        raw_text = c.get('raw_text', '')
        local_img = c.get('local_image_path')
        
        clean_name = title.strip()
        
        animal_type_id = 2 # Cat
        if 'geeble' in clean_name.lower() or 'dog' in clean_name.lower() or 'puppy' in clean_name.lower():
            animal_type_id = 1 # Dog
        elif 'bird' in clean_name.lower() or 'parrot' in clean_name.lower():
            animal_type_id = 3
            
        breed_id = determine_breed_id(animal_type_id, clean_name, infobox, raw_text)
        if 'geeble' in clean_name.lower():
            breed_id = 1 # Pug
        
        h = sum(ord(ch) for ch in clean_name)
        age = (h % 7) + 1
        
        idx = len(pet_rows)
        desc = generate_dynamic_description(idx, clean_name, infobox, raw_text)
        behavior = generate_dynamic_behavior(idx, clean_name, infobox, raw_text)
        photo_path = local_img if local_img else "www/img/animals/glooble.jpg"
        
        pet_rows.append({
            'id': pet_id,
            'name': clean_name,
            'animal': animal_type_id,
            'breed': breed_id,
            'age': age,
            'description': desc,
            'behavior': behavior,
            'photo': photo_path,
            'status': 'Available'
        })
        pet_id += 1
        
    # Clean up orphaned images from pruned characters in www/img/animals/
    img_dir = "www/img/animals"
    active_image_filenames = set()
    for p in pet_rows:
        if p['photo']:
            active_image_filenames.add(os.path.basename(p['photo']))
            
    # Essential pre-existing site assets to preserve
    essential_assets = {'glooble.jpg', 'bleemk.png', 'geeble.png', 'tole_tole.gif', 'tole_tole.png', '1734197731_glorpo.png', '1734214207_gnapy.png', '1734214327_zim_zorp.png', '1734477626_LORE Club Logo.png', '1734477808_AdobeStock_189776679.jpeg', '1734478936_AdobeStock_281792532.jpeg'}
    active_image_filenames.update(essential_assets)
    
    removed_images_count = 0
    if os.path.exists(img_dir):
        for fname in os.listdir(img_dir):
            if fname not in active_image_filenames:
                fpath = os.path.join(img_dir, fname)
                if os.path.isfile(fpath):
                    os.remove(fpath)
                    removed_images_count += 1
                    
    print(f"Cleaned up {removed_images_count} orphaned images belonging to pruned characters from {img_dir}.")
    print(f"Generation complete: Preserved {len(pet_rows)} pets (including all FACT group members), pruned {pruned_count} entries.")
    
    # Generate SQL file
    sql_lines = []
    sql_lines.append("-- Silly Cats Wiki Pet Adoption Database Import Script")
    sql_lines.append("SET NAMES utf8mb4;")
    sql_lines.append("SET FOREIGN_KEY_CHECKS = 0;")
    sql_lines.append("DROP TABLE IF EXISTS `reservations`;")
    sql_lines.append("DROP TABLE IF EXISTS `pets`;")
    sql_lines.append("DROP TABLE IF EXISTS `breeds`;\n")
    
    sql_lines.append("CREATE TABLE `breeds` (")
    sql_lines.append("  `id` int(11) NOT NULL AUTO_INCREMENT,")
    sql_lines.append("  `breed_name` varchar(200) NOT NULL,")
    sql_lines.append("  `animal_type_id` int(11) NOT NULL,")
    sql_lines.append("  PRIMARY KEY (`id`)")
    sql_lines.append(") ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;\n")

    sql_lines.append("CREATE TABLE `pets` (")
    sql_lines.append("  `id` int(11) NOT NULL AUTO_INCREMENT,")
    sql_lines.append("  `name` varchar(200) NOT NULL,")
    sql_lines.append("  `animal` int(11) NOT NULL,")
    sql_lines.append("  `breed` int(255) NOT NULL,")
    sql_lines.append("  `age` int(11) NOT NULL,")
    sql_lines.append("  `description` text NOT NULL,")
    sql_lines.append("  `behavior` varchar(200) NOT NULL,")
    sql_lines.append("  `photo` varchar(255) NOT NULL,")
    sql_lines.append("  `status` varchar(50) NOT NULL DEFAULT 'Available',")
    sql_lines.append("  PRIMARY KEY (`id`)")
    sql_lines.append(") ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;\n")
    
    sql_lines.append("CREATE TABLE `reservations` (")
    sql_lines.append("  `id` int(11) NOT NULL AUTO_INCREMENT,")
    sql_lines.append("  `user_id` int(11) NOT NULL,")
    sql_lines.append("  `pet_id` int(11) NOT NULL,")
    sql_lines.append("  `status` varchar(50) NOT NULL DEFAULT 'Pending',")
    sql_lines.append("  `notes` text DEFAULT NULL,")
    sql_lines.append("  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,")
    sql_lines.append("  PRIMARY KEY (`id`),")
    sql_lines.append("  KEY `user_id` (`user_id`),")
    sql_lines.append("  KEY `pet_id` (`pet_id`),")
    sql_lines.append("  CONSTRAINT `fk_reservations_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,")
    sql_lines.append("  CONSTRAINT `fk_reservations_pet` FOREIGN KEY (`pet_id`) REFERENCES `pets` (`id`) ON DELETE CASCADE")
    sql_lines.append(") ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;\n")

    sql_lines.append("SET FOREIGN_KEY_CHECKS = 1;\n")

    # Insert Breeds
    sql_lines.append("-- Dumping data for table `breeds`")
    sql_lines.append("INSERT INTO `breeds` (`id`, `breed_name`, `animal_type_id`) VALUES")
    breed_values = [f"({b[0]}, {escape_sql(b[1])}, {b[2]})" for b in BREEDS]
    sql_lines.append(",\n".join(breed_values) + ";\n")
    
    # Insert Pets
    sql_lines.append("-- Dumping data for table `pets`")
    sql_lines.append("INSERT INTO `pets` (`id`, `name`, `animal`, `breed`, `age`, `description`, `behavior`, `photo`, `status`) VALUES")
    pet_values = []
    for p in pet_rows:
        val = f"({p['id']}, {escape_sql(p['name'])}, {p['animal']}, {p['breed']}, {p['age']}, {escape_sql(p['description'])}, {escape_sql(p['behavior'])}, {escape_sql(p['photo'])}, {escape_sql(p['status'])})"
        pet_values.append(val)
    sql_lines.append(",\n".join(pet_values) + ";\n")
    
    sql_content = "\n".join(sql_lines)
    
    with open(SQL_IMPORT_FILE, "w", encoding="utf-8") as f:
        f.write(sql_content)
    print(f"Wrote updated SQL import file: {SQL_IMPORT_FILE}")
    
    if os.path.exists(SQL_MAIN_FILE):
        with open(SQL_MAIN_FILE, "r", encoding="utf-8") as f:
            main_sql = f.read()
            
        breeds_insert_str = "INSERT INTO `breeds` (`id`, `breed_name`, `animal_type_id`) VALUES\n" + ",\n".join(breed_values) + ";"
        main_sql = re.sub(r'INSERT INTO `breeds`[\s\S]*?;\n', breeds_insert_str + "\n", main_sql, count=1)
        
        pets_insert_str = "INSERT INTO `pets` (`id`, `name`, `animal`, `breed`, `age`, `description`, `behavior`, `photo`, `status`) VALUES\n" + ",\n".join(pet_values) + ";"
        main_sql = re.sub(r'INSERT INTO `pets`[\s\S]*?;\n', pets_insert_str + "\n", main_sql, count=1)
        
        with open(SQL_MAIN_FILE, "w", encoding="utf-8") as f:
            f.write(main_sql)
        print(f"Updated main database file: {SQL_MAIN_FILE}")

if __name__ == "__main__":
    main()
