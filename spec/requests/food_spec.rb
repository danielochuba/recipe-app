# spec/controllers/food_controller_spec.rb

require 'rails_helper'

RSpec.describe FoodController, type: :controller do
  include Devise::Test::ControllerHelpers

  let(:user) { FactoryBot.create(:user) }
  let(:recipe) { FactoryBot.create(:recipe, user: user) }
  let(:food) { FactoryBot.create(:food, user: user) }

  before do
    sign_in user
  end

  describe 'POST #create' do
    let(:food_params) { FactoryBot.attributes_for(:food) }

    it 'creates a new food' do
      expect {
        post :create, params: { food: food_params, user_id: user.id}
      }.to change(Food, :count).by(0)
    end

    it 'creates a new RecipeFood association' do
      expect {
        post :create, params: { user_id: user.id, food: food_params, recipe_id: recipe.id }
      }.to change(RecipeFood, :count).by(0)
    end
  end
end
