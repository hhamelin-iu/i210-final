async function fetchBreeds(animalId, breedSelectId) {
    try {
        const response = await fetch(`get_breeds.php?animal_id=${animalId}`);
        const breeds = await response.json();
        const breedSelect = document.getElementById(breedSelectId);

        // Clear existing options
        breedSelect.innerHTML = '<option value="">Select a breed</option>';

        // Populate new options
        breeds.forEach(breed => {
            const option = document.createElement('option');
            option.value = breed.id;
            option.textContent = breed.breed_name;
            breedSelect.appendChild(option);
        });

        // Set the selected breed if it exists
        const currentBreedId = breedSelect.dataset.selectedBreed;
        if (currentBreedId) {
            breedSelect.value = currentBreedId;
        }
    } catch (error) {
        console.error('Error fetching breeds:', error);
    }
}

function initializeBreedUpdater(animalSelectId, breedSelectId) {
    const animalSelect = document.getElementById(animalSelectId);
    const breedSelect = document.getElementById(breedSelectId);

    // Attach event listener to the animal type dropdown
    animalSelect.addEventListener('change', (e) => {
        const animalId = e.target.value;
        if (animalId) {
            fetchBreeds(animalId, breedSelectId);
        } else {
            // Clear the breed dropdown if no animal is selected
            breedSelect.innerHTML = '<option value="">Select a breed</option>';
        }
    });

    // Preload breeds if an animal type is already selected
    const currentAnimalId = animalSelect.value;
    if (currentAnimalId) {
        fetchBreeds(currentAnimalId, breedSelectId);
    }
}
