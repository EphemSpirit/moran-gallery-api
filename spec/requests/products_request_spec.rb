require 'rails_helper'

RSpec.describe :Products, type: :request do
    let (:product) { build(:product) }

    describe "#create" do
        context "when valid params" do
            it "returns the object" do
                params = {
                    product: {
                        category: "jewelry",
                        price: 12.99,
                        description: "Test product"
                    }
                }
                post '/api/v1/products', params: params
                json = JSON.parse(response.body)
                expect(json['category']).to eq "jewelry"
                expect(json['price']).to eq "12.99"
                expect(json['description']).to eq "Test product"
            end
        end
    end
end