import urllib.request
import urllib.parse
import json
import re
import os
import time
import concurrent.futures
from html import unescape

OUTPUT_JSON = "data/raw_characters.json"
IMG_DIR = "www/img/animals"

os.makedirs("data", exist_ok=True)
os.makedirs(IMG_DIR, exist_ok=True)

def fetch_category_members():
    members = []
    cmcontinue = None
    headers = {'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)'}
    
    while True:
        url = 'https://sillycattvseries.fandom.com/api.php?action=query&list=categorymembers&cmtitle=Category:Characters&cmlimit=500&format=json'
        if cmcontinue:
            url += f'&cmcontinue={cmcontinue}'
        
        req = urllib.request.Request(url, headers=headers)
        with urllib.request.urlopen(req) as resp:
            data = json.loads(resp.read().decode('utf-8'))
            query = data.get('query', {})
            members.extend(query.get('categorymembers', []))
            
            if 'continue' in data and 'cmcontinue' in data['continue']:
                cmcontinue = data['continue']['cmcontinue']
            else:
                break
    return members

def clean_image_filename(filename):
    if not filename:
        return None
    fn = re.sub(r'\[\[', '', filename)
    fn = re.sub(r'\]\]', '', fn)
    fn = re.sub(r'File:', '', fn, flags=re.IGNORECASE)
    fn = fn.strip()
    if fn.startswith('<') or fn.startswith('http') or 'placeholder' in fn.lower():
        return None
    return fn

def fetch_page_details(title):
    headers = {'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)'}
    parse_url = f'https://sillycattvseries.fandom.com/api.php?action=parse&page={urllib.parse.quote(title)}&prop=wikitext|text|images&format=json'
    req = urllib.request.Request(parse_url, headers=headers)
    
    try:
        with urllib.request.urlopen(req) as resp:
            data = json.loads(resp.read().decode('utf-8'))
            if 'error' in data:
                return None
            parse = data['parse']
            wikitext = parse.get('wikitext', {}).get('*', '')
            html = parse.get('text', {}).get('*', '')
            images = parse.get('images', [])
            
            # Find main image filename from infobox or wikitext or images
            main_image_filename = None
            img_match = re.search(r'\|\s*image\s*=\s*([^|\}\n]+)', wikitext, re.IGNORECASE)
            if img_match:
                main_image_filename = clean_image_filename(img_match.group(1))
                
            if not main_image_filename:
                # Regex search for any File: pattern in wikitext
                file_matches = re.findall(r'\[\[File:([^|\]\n]+)', wikitext, re.IGNORECASE)
                if file_matches:
                    for fm in file_matches:
                        cleaned_fm = clean_image_filename(fm)
                        if cleaned_fm:
                            main_image_filename = cleaned_fm
                            break
                            
            if not main_image_filename and images:
                valid_imgs = [clean_image_filename(i) for i in images if i.lower() not in ['twitter.png', 'instagram.png', 'tiktok.png', 'youtube.png', 'canon.png', 'discord.png', 'site-logo.png', 'wiki.png']]
                valid_imgs = [i for i in valid_imgs if i]
                if valid_imgs:
                    main_image_filename = valid_imgs[0]
            
            image_url = None
            if main_image_filename:
                file_title = f'File:{main_image_filename}'
                img_api = f'https://sillycattvseries.fandom.com/api.php?action=query&titles={urllib.parse.quote(file_title)}&prop=imageinfo&iiprop=url&format=json'
                req_img = urllib.request.Request(img_api, headers=headers)
                try:
                    with urllib.request.urlopen(req_img) as resp_img:
                        data_img = json.loads(resp_img.read().decode('utf-8'))
                        pages = data_img.get('query', {}).get('pages', {})
                        for pid, pdata in pages.items():
                            if 'imageinfo' in pdata and len(pdata['imageinfo']) > 0:
                                image_url = pdata['imageinfo'][0]['url']
                except Exception as e:
                    pass
                    
            # Parse infobox fields
            infobox = {}
            infobox_match = re.search(r'\{\{Character([\s\S]*?)\}\}', wikitext, re.IGNORECASE)
            if infobox_match:
                params = re.findall(r'\|\s*([a-zA-Z0-9_]+)\s*=\s*([^|\}\n]+)', infobox_match.group(1))
                for k, v in params:
                    infobox[k.strip().lower()] = v.strip()
                    
            # Clean HTML text
            clean_html = re.sub(r'<table[\s\S]*?</table>', '', html)
            clean_html = re.sub(r'<style[\s\S]*?</style>', '', html)
            clean_html = re.sub(r'<script[\s\S]*?</script>', '', html)
            clean_text = re.sub(r'<[^>]+>', ' ', clean_html)
            clean_text = unescape(clean_text)
            clean_text = re.sub(r'\s+', ' ', clean_text).strip()
            
            return {
                'title': title,
                'infobox': infobox,
                'wikitext': wikitext,
                'raw_text': clean_text,
                'image_filename': main_image_filename,
                'image_url': image_url
            }
    except Exception as e:
        print(f"Error fetching {title}: {e}")
        return None

def download_image(url, filename_prefix):
    if not url:
        return None
    headers = {'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)'}
    try:
        ext = ".png"
        clean_url = url.split("?")[0]
        if clean_url.lower().endswith(".jpg") or clean_url.lower().endswith(".jpeg"):
            ext = ".jpg"
        elif clean_url.lower().endswith(".gif"):
            ext = ".gif"
        elif clean_url.lower().endswith(".webp"):
            ext = ".webp"
            
        safe_name = re.sub(r'[^a-zA-Z0-9_]', '_', filename_prefix.lower()).strip('_')
        out_filename = f"{safe_name}{ext}"
        out_path = os.path.join(IMG_DIR, out_filename)
        
        req = urllib.request.Request(url, headers=headers)
        with urllib.request.urlopen(req) as resp, open(out_path, 'wb') as out_file:
            content = resp.read()
            out_file.write(content)
            
        # Inspect magic bytes to enforce correct extension
        header = content[:10]
        correct_ext = ext
        if header.startswith(b'GIF87a') or header.startswith(b'GIF89a'):
            correct_ext = '.gif'
        elif header.startswith(b'\x89PNG\r\n\x1a\n'):
            correct_ext = '.png'
        elif header.startswith(b'\xff\xd8\xff'):
            correct_ext = '.jpg'
        elif header.startswith(b'RIFF') and b'WEBP' in header:
            correct_ext = '.webp'
            
        if correct_ext != ext:
            new_filename = f"{safe_name}{correct_ext}"
            new_path = os.path.join(IMG_DIR, new_filename)
            if os.path.exists(out_path):
                os.rename(out_path, new_path)
            return f"www/img/animals/{new_filename}"
            
        return f"www/img/animals/{out_filename}"
    except Exception as e:
        print(f"Error downloading image for {filename_prefix}: {e}")
        return None

def process_member(m):
    title = m['title']
    if title.startswith('File:') or title.startswith('Category:') or title.startswith('Template:'):
        return None
    info = fetch_page_details(title)
    if info:
        if info['image_url']:
            local_path = download_image(info['image_url'], title)
            info['local_image_path'] = local_path
        else:
            info['local_image_path'] = None
        print(f"Scraped & Image Processed: {title} -> {info.get('local_image_path')}")
        return info
    return None

def main():
    print("Fetching Category:Characters list...")
    members = fetch_category_members()
    print(f"Found {len(members)} entries in Category:Characters.")
    
    results = []
    with concurrent.futures.ThreadPoolExecutor(max_workers=15) as executor:
        futures = [executor.submit(process_member, m) for m in members]
        for future in concurrent.futures.as_completed(futures):
            res = future.result()
            if res:
                results.append(res)
        
    with open(OUTPUT_JSON, "w", encoding="utf-8") as f:
        json.dump(results, f, indent=2, ensure_ascii=False)
        
    print(f"Successfully scraped {len(results)} characters into {OUTPUT_JSON}.")

if __name__ == "__main__":
    main()
