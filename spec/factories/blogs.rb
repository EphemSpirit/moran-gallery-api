FactoryBot.define do
  factory :blog do
    content { "MyText" }
  end

  trait :with_admin do
    user { create(:user, :admin) }
  end

  trait :with_customer_user do
    user { create(:user, :customer) }
  end
end
