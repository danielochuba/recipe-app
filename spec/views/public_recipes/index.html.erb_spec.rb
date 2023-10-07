require 'rails_helper'

RSpec.describe 'public_recipes/index', type: :view do
  let(:public_recipes) { FactoryBot.create_list(:recipe, 3, public: true, user: FactoryBot.create(:user)) }

  before do
    assign(:public_recipes, public_recipes)
    render
  end

  it 'displays the list of public recipes' do
    expect(rendered).to have_content('Public Recipes') # Asegura que se muestra el título adecuado.

    public_recipes.each do |recipe|
      expect(rendered).to have_text(recipe.name)
      expect(rendered).to have_text("Publish by: #{recipe.user.name}")
      expect(rendered).to have_text("Total food items: #{RecipeFood.where(recipe_id: recipe.id).count}")
      expect(rendered).to have_text("Total price: $#{RecipeFood.where(recipe_id: recipe.id).joins(:food).sum('foods.price * recipe_foods.quantity').to_f}")
    end
  end

  it 'displays a message when there are no public recipes' do
    assign(:public_recipes, []) # Simula que no hay recetas públicas asignadas.

    render

    expect(rendered).to have_content('No public recipes available') # Asegura que se muestra el mensaje adecuado.
  end
end
