FactoryBot.define do
    factory :food do
      name { "Rice" }
      measurement_unit { "gram" }
      price { 1.0 }
      quantity { 1 }
      user { FactoryBot.create(:user, email: "correo@ejemplo.com") }
    end
  end
