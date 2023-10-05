class ShoppingListsController < ApplicationController

  def index
    # recipes_controller.rb
    @shopping_list = {}
    recipes = Recipe.all
    recipes.each do |recipe|
      recipe.recipe_foods.each do |rf|
        food = rf.food
        next unless food && rf.quantity && food.quantity # Skip if food, quantity, or available_quantity is nil
        required_quantity = rf.quantity
        available_quantity = food.quantity
        if required_quantity > available_quantity
          to_purchase = required_quantity - available_quantity
          cost = to_purchase * food.price

          # Check if the food item already exists in the shopping list
          if @shopping_list.key?(food.name)
            @shopping_list[food.name][:required_quantity] += required_quantity
            @shopping_list[food.name][:to_purchase] += to_purchase
            @shopping_list[food.name][:cost] += cost
          else
            @shopping_list[food.name] = {
              name: food.name,
              measurement_unit: food.measurement_unit,
              required_quantity: required_quantity,
              available_quantity: available_quantity,
              to_purchase: to_purchase,
              cost: cost
            }
          end
        end
      end
    end

    @shopping_list = @shopping_list.values
  end
end
