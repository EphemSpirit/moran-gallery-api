FactoryBot.define do
  factory :cart_item do
    product_id { create(:product) }
    cart_id { 1 }
  end
end
