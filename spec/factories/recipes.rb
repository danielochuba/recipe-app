FactoryBot.define do
  factory :recipe do
    name { 'Delicious Recipe' }
    description { 'This is a tasty recipe.' }
    preparation_time { 30 }
    cooking_time { 30 }
    public { true }
    user
  end
end
