// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

// app/assets/javascripts/recipe.js
// app/assets/javascripts/recipe.js
document.addEventListener('DOMContentLoaded', function() {
    // Obtén una referencia al botón y al elemento div
    var addButton = document.getElementById('add-ingredient-button');
    var ingredientForm = document.getElementById('ingredient-form');
  
    // Agrega un controlador de eventos al botón
    addButton.addEventListener('click', function(event) {
      event.preventDefault(); // Evita que el botón realice una acción de envío
  
      // Alterna la visibilidad del elemento div
      if (ingredientForm.style.display === 'none' || ingredientForm.style.display === '') {
        ingredientForm.style.display = 'block';
        addButton.style.display = 'none'; // Oculta el botón cuando se muestra el formulario
      } else {
        ingredientForm.style.display = 'none';
        addButton.style.display = 'block'; // Muestra el botón cuando se oculta el formulario
      }
    });
  });
  