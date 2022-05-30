FactoryBot.define do
    factory :product do
      category { "jewelry" }
      price { 12.99 }
      description { "This is a test product" }
    end
end