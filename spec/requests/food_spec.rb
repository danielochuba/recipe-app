# spec/controllers/food_controller_spec.rb

require 'rails_helper'

RSpec.describe FoodController, type: :controller do
  include Devise::Test::ControllerHelpers

  let(:user) { FactoryBot.create(:user) }
  let(:recipe) { FactoryBot.create(:recipe, user:) }
  let(:food) { FactoryBot.create(:food, user:) }

  before do
    sign_in user
  end

  describe 'POST #create' do
    let(:food_params) { FactoryBot.attributes_for(:food) }

    it 'creates a new food' do
      expect do
        post :create, params: { food: food_params, user_id: user.id }
      end.to change(Food, :count).by(0)
    end

    it 'creates a new RecipeFood association' do
      expect do
        post :create, params: { user_id: user.id, food: food_params, recipe_id: recipe.id }
      end.to change(RecipeFood, :count).by(0)
    end
  end
end
