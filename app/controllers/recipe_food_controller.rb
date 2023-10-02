class RecipeFoodController < ApplicationController

  def new
    @recipe = Recipe.find(params[:recipe_id])
    @food = Food.new

    respond_to do |format|
      format.html { render :new, locals: { recipe: @recipe, food: @food } }
      format.js { render partial: "new_recipe_food" }
    end
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @food = Food.find(params[:food_id])

    @recipe.foods << @food

    respond_to do |format|
      format.html { redirect_to recipe_path(@recipe), notice: 'Food was successfully added to recipe.' }
    end
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @food = Food.find(params[:food_id])

    @recipe.foods.delete(@food)

    respond_to do |format|
      format.html { redirect_to recipe_path(@recipe), notice: 'Food was successfully removed from recipe.' }
    end
  end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:recipe_id, :food_id)
  end

end
