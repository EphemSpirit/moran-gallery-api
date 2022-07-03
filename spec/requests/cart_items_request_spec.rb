require 'rails_helper'

RSpec.describe "CartItems", type: :request do
    describe "#create" do
        it "creates a cart_item" do
            user = create(:user, :customer, :with_cart)
            product = create(:product)
            sign_in user
            params = {
                cart_item: {
                    product_id: product.id,
                    cart_id: user.cart.id
                }
            }
            post '/api/v1/cart_items', params: params
            expect(response).to have_http_status(200)
        end
    end
end