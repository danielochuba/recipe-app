require 'rails_helper'

RSpec.describe 'Please Customize the email and password with yours: public_recipes/index', type: :feature do
  describe 'index page' do
    let(:user) { User.create(id: 1, name: 'Daniel Ochuba', email: 'danielochuba78@gmail.com', password: 'Welcome126@') }

    let(:recipe) do
      Recipe.create(id: 1, preparation_time: 2.5, cooking_time: 2.0, name: 'Sample Recipe', public: true,
                    user_id: user.id)
    end
    before do
      visit user_recipes_path(user)

      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password

      # Click the sign-in button (adjust the selector based on your UI)
      click_button 'Log in'
    end

    it 'renders the index view' do
      expect(page).to have_content('Recipes')
    end
  end
end
