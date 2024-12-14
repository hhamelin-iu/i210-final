async function fetchBreeds(animalId, currentBreedId = null) {
    const response = await fetch(`get_breeds.php?animal_id=${animalId}`);
    const breeds = await response.json();
    const breedSelect = document.getElementById('breed');

    // Clear existing options
    breedSelect.innerHTML = '<option value="">Select a breed</option>';

    // Populate new options and preselect the current breed
    breeds.forEach(breed => {
        const option = document.createElement('option');
        option.value = breed.id;
        option.textContent = breed.breed_name;
        if (breed.id == currentBreedId) {
            option.selected = true; // Preselect current breed
        }
        breedSelect.appendChild(option);
    });
}

document.addEventListener('DOMContentLoaded', () => {
    const animalSelect = document.getElementById('animal');
    const breedSelect = document.getElementById('breed');
    const currentAnimalId = animalSelect.value;
    const currentBreedId = breedSelect.getAttribute('data-current-breed');

    animalSelect.addEventListener('change', (e) => {
        const animalId = e.target.value;
        if (animalId) {
            fetchBreeds(animalId);
        } else {
            breedSelect.innerHTML = '<option value="">Select a breed</option>';
        }
    });

    // Preload breeds with current breed preselected if an animal type is already selected
    if (currentAnimalId) {
        fetchBreeds(currentAnimalId, currentBreedId);
    }
});
