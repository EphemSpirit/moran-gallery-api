FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { "password" }
    password_confirmation { "password" }
  end

  trait :customer do
    role { 1 }
  end

  trait :admin do
    role { 0 }
  end

  trait :with_cart do
    cart { create(:cart) }
  end
end
