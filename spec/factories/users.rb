FactoryBot.define do
  factory :user do
    email { "email@example.com" }
    password { "password" }
    password_confirmation { "password" }
  end

  trait :customer do
    role { 1 }
  end

  trait :admin do
    role { 0 }
  end
end
