require 'rails_helper'

RSpec.describe PublicRecipesController, type: :controller do
  include Devise::Test::ControllerHelpers

  describe 'GET #index' do
    it 'redirects to the sign-in page' do
      get :index
      expect(response).to redirect_to(new_user_session_path)
    end
  end
end
