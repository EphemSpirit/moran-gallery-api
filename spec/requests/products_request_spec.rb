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

    describe "#update" do
        context "when valid props" do
            it "updates the item" do
                fresh_prod = create(:product)
                new_description = "This is a new description"
                params = { description: new_description }

                put "/api/v1/products/#{fresh_prod.id}", params: { product: params }
                json = JSON.parse(response.body)
                expect(json['description']).to eq new_description
            end
        end
    end

    describe "#destroy" do
        it "returns 200" do
            product = create(:product)
            delete "/api/v1/products/#{product.id}"
            expect(response).to have_http_status(200)
        end
    end
end