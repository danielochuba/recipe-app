require 'rails_helper'

RSpec.describe Food, type: :model do
  let(:user) { User.create(name: 'John Doe') }

  describe 'associations' do
    it 'belongs to user' do
      food = Food.create(user: user, measurement_unit: 'gram', price: 1.2, quantity: 1)
      expect(food.user).to eq(user)
    end
  end

  describe 'validation' do

    it 'is not valid with a negative price' do
      food = Food.create(user: user, measurement_unit: 'gram', price: -1.2, quantity: 1)
      expect(food).not_to be_valid
    end

    it 'is not valid with a negative quantity' do
      food = Food.create(user: user, measurement_unit: 'gram', price: 1.2, quantity: -1)
      expect(food).not_to be_valid
    end

    it 'price should be valid numericality' do
      food = Food.create(user: user, measurement_unit: 'gram', price: 'not_a_number', quantity: 1)
      expect(food).not_to be_valid
    end

    it 'quantity should be valid numericality' do
      food = Food.create(user: user, measurement_unit: 'gram', price: 1.2, quantity: 'not_a_number')
      expect(food).not_to be_valid
    end
  end
end
