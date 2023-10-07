require 'rails_helper'

RSpec.describe RecipeController, type: :controller do
  include Devise::Test::ControllerHelpers

  let(:user) { FactoryBot.create(:user) }
  let(:recipe) { FactoryBot.create(:recipe, user:) }

  describe 'GET #show' do
    context 'when a user is not authenticated' do
      before do
        get :show, params: { user_id: user.id, id: recipe.id }
      end

      it 'redirects to the sign-in page' do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
