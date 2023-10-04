class RecipeFoodsController < ApplicationController
  before_action :authenticate_user!

  def new
    @user = current_user
    @recipe = Recipe.find(params[:recipe_id])
    @food = Food.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @food = Food.new(food_params)
  
    if @food.save
      @recipe_food = @recipe.recipe_foods.create(food: @food, quantity: params[:recipe_food][:quantity])
      @recipe_foods = @recipe.foods # Ingredientes de la receta actual
      @foods = Food.all # Todos los ingredientes de todas las recetas
      redirect_to @recipe, notice: "Ingredient added successfully."
    else
      render "recipes/show"
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
