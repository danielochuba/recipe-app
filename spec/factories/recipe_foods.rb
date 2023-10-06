FactoryBot.define do
    factory :recipe_food do
      quantity { 1 } # Establece la cantidad predeterminada
      recipe # Asocia automáticamente una receta válida
      food # Asocia automáticamente un alimento válido
    end
  end
  