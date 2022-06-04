FactoryBot.define do
  factory :review do
    star_count { 3 }
    content { "this is a test review" }
    user { create(:user, :customer) }
    product factory: :product
  end
end
