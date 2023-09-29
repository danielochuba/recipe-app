class RecipeController < ApplicationController

  def index
    @user = User.find(current_user.id)
    @recipes = @user.recipes
  end

  def new
    @recipe = Recipe.new

    respond_to do |format|
      format.html { render :new, locals: { user: current_user, recipe: @recipe } }
    end
  end

  def create
    @user = User.find(current_user.id)
    @recipe = @user.recipes.new(recipe_params)

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to new_user_recipe_path(@user), notice: 'Recipe was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    @user = User.find(current_user.id)
    @recipe = @user.recipes.find(params[:id])
    @recipe.destroy

    respond_to do |format|
      format.html { redirect_to user_recipes_path(@user), notice: 'Recipe was successfully deleted.' }
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
