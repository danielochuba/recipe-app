require 'rails_helper'

RSpec.describe 'Please Customize the email and password with yours: public_recipes/index', type: :feature do
  describe 'index page' do
    let(:user) { User.create(id: 3, name: 'Daniel Ochuba', email: 'Hello@gmail.com', password: 'Welcome126@') }

    let(:recipe) do
      Recipe.create(id: 2, preparation_time: 2.5, cooking_time: 2.0, name: 'Sample Recipe', public: true,
                    user_id: user.id)
    end
    before do
      visit new_user_registration_path

      # Fill in the registration form fields with user details
      fill_in 'Name', with: user.name
      fill_in 'Email', with: 'good@gmail.com'
      fill_in 'Password', with: user.password
      fill_in 'Password confirmation', with: user.password

      click_button 'Sign up'
      user.confirm
      sleep 3

      fill_in 'Email', with: 'good@gmail.com'
      fill_in 'Password', with: user.password

      # # Click the sign-in button (adjust the selector based on your UI)
      click_button 'Log in'
    end

    it 'renders the index view' do
      expect(page).to have_content('You have to confirm your email address before continuing.')
    end
  end
end
