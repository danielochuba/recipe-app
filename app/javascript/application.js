// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

// app/assets/javascripts/recipe.js
document.addEventListener('DOMContentLoaded', function() {

    var addButton = document.getElementById('add-ingredient-button');
    var ingredientForm = document.getElementById('ingredient-form');
  
    addButton.addEventListener('click', function(event) {
      event.preventDefault(); 
  
      if (ingredientForm.style.display === 'none' || ingredientForm.style.display === '') {
        ingredientForm.style.display = 'block';
        addButton.style.display = 'none'; 
      } else {
        ingredientForm.style.display = 'none';
        addButton.style.display = 'block'; 
      }
    });
  });
  