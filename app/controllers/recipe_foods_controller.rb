class RecipeFoodsController < ApplicationController
  before_action :authenticate_user!

  def new
    @user = current_user
    @recipe = Recipe.find(params[:recipe_id])
    @food = Food.new
    @recipe_food = RecipeFood.new # Inicializa @recipe_food aquí
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])

    # Obtener el nombre del ingrediente seleccionado del formulario
    selected_food_id = params[:recipe_food][:food_id]


    # Buscar el ingrediente por su nombre en la tabla Food
    food = Food.find(selected_food_id.to_i)

    if food
      # Si se encontró el ingrediente, crear la asociación en RecipeFood
      @recipe_food = RecipeFood.new(
        recipe_id: @recipe.id,
        food_id: food.id,
        quantity: params[:recipe_food][:quantity]
      )

      if @recipe_food.save
        redirect_to show_user_recipe_path(current_user, @recipe), notice: "Ingredient added successfully."
      else
        render "recipe/show"
      end
    else
      # Manejar el caso en que el ingrediente no se encontró
      # Puedes mostrar un mensaje de error o tomar alguna otra acción
      flash[:alert] = "Ingredient not found. Please select a valid ingredient."
      render "recipe/show"
    end
  end

  def update
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_foods.find(params[:id])

    if @recipe_food.update(recipe_food_params)
      redirect_to show_user_recipe_path(current_user, @recipe), notice: "Ingredient quantity updated successfully."
    else
      redirect_to show_user_recipe_path(current_user, @recipe), alert: "Failed to update ingredient quantity."
    end
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_foods.find(params[:id])

    if @recipe_food.destroy
      redirect_to show_user_recipe_path(current_user, @recipe), notice: "Ingredient removed successfully."
    else
      redirect_to show_user_recipe_path(current_user, @recipe), alert: "Failed to remove ingredient."
    end
  end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:food_name, :quantity)
  end
end
