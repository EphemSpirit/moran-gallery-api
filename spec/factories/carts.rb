FactoryBot.define do
  factory :cart do
    user_id { create(:user) }
    shipment_id { 1 }
  end
end
