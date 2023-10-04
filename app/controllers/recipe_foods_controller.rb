class RecipeFoodsController < ApplicationController
  before_action :authenticate_user!

  def new
    @user = current_user
    @recipe = Recipe.find(params[:recipe_id])
    @food = Food.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
  
    # Step 1: Create a new ingredient in the food list
    @food = Food.new(food_params)
  
    if @food.save
      # Step 2: Associate the ingredient with the recipe
      @recipe_food = @recipe.recipe_foods.create(food: @food, quantity: params[:recipe_food][:quantity])
      
      # Redirect to the recipe show page after successfully adding the ingredient
      redirect_to show_user_recipe_path(current_user, @recipe), notice: "Ingredient added successfully."
    else
      # Handle validation errors or other failures
      render "recipe/show"
    end
  end
  
  
 
  def update
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_foods.find(params[:id])

    if @recipe_food.update(recipe_food_params)
      redirect_to @recipe, notice: "Ingredient updated successfully."
    else
      render "recipe/show"
    end
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_foods.find(params[:id])
    @recipe_food.destroy
    redirect_to @recipe, notice: "Ingredient removed successfully."
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end

  def recipe_food_params
    params.require(:recipe_food).permit(:food_id, :recipe_id, :quantity)
  end
end
