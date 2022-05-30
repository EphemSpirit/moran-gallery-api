require 'rails_helper'

RSpec.describe :Products, type: :request do
    let(:product) { build(:product) }

    describe "#index" do
        it "returns all products" do
            create_list(:product, 3)
            get '/api/v1/products'
            json = JSON.parse(response.body)
            expect(json.length).to eq 3
        end
    end

    describe "#create" do
        context "when admin user" do
            it "returns the object" do
                user = create(:user, :admin)
                sign_in user
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

        context "when customer" do
            it "returns 422 unauthenticated" do
                user = create(:user, :customer)
                sign_in user
                params = {
                    product: {
                        category: "jewelry",
                        price: 12.99,
                        description: "Test product"
                    }
                }
                post '/api/v1/products', params: params
                expect(response).to have_http_status(422)
            end
        end
    end

    describe "#update" do
        context "when valid props and admin" do
            it "updates the item" do
                user = create(:user, :admin)
                fresh_prod = create(:product)
                new_description = "This is a new description"
                params = { description: new_description }

                sign_in user

                put "/api/v1/products/#{fresh_prod.id}", params: { product: params }
                json = JSON.parse(response.body)
                expect(json['description']).to eq new_description
            end
        end

        context "when not admin" do
            it "updates the item" do
                user = create(:user, :customer)
                fresh_prod = create(:product)
                new_description = "This is a new description"
                params = { description: new_description }

                sign_in user

                put "/api/v1/products/#{fresh_prod.id}", params: { product: params }
                expect(response).to have_http_status(422)
            end
        end
    end

    describe "#destroy" do
        
        
        it "returns 200 when admin" do
            admin = create(:user, :admin)
            product = create(:product)
            sign_in admin
            delete "/api/v1/products/#{product.id}"
            expect(response).to have_http_status(200)
        end

        it "returns 422 when customer" do
            customer = create(:user, :customer)
            product = create(:product)
            sign_in customer
            delete "/api/v1/products/#{product.id}"
            expect(response).to have_http_status(422)
        end
    end
end