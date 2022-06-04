require 'rails_helper'

RSpec.describe "Reviews", type: :request do

    describe "#index" do
        it "returns all reviews" do
            create_list(:review, 4)
            get '/api/v1/reviews'
            json = JSON.parse(response.body)
            expect(json.length).to eq 4
        end
    end

    describe "#create" do
        context "when admin" do
            it "doesn't let you post a review" do
                user = create(:user, :admin)
                product = create(:product)
                sign_in user
                params = {
                    review: {
                        star_count: 3,
                        content: "test review",
                        user_id: user.id,
                        product_id: product.id
                    }
                }

                post "/api/v1/products/#{product.id}/reviews", params: params
                expect(response).to have_http_status(422)
            end
        end

        context "when customer" do
            it "posts the review" do
                user = create(:user, :customer)
                product = create(:product)
                sign_in user
                params = {
                    review: {
                        star_count: 3,
                        content: "test review",
                        user_id: user.id,
                        product_id: product.id
                    }
                }

                post "/api/v1/products/#{product.id}/reviews", params: params
                json = JSON.parse(response.body)
                expect(response).to have_http_status(200)
                expect(json['message']).to eq 'Review posted!'
            end
        end
    end

    describe "#destroy" do
        context "when not admin" do
            it "deletes the review" do
                user = create(:user, :customer)
                product = create(:product)
                sign_in user
                review = Review.create(
                    star_count: 3,
                    content: "This is a test",
                    user_id: user.id,
                    product_id: product.id
                )

                delete "/api/v1/products/#{product.id}/reviews/#{review.id}"
                expect(response).to have_http_status(200)
            end
        end

        context "when admin" do
            it "does not delete the review" do
                review = create(:review)
                user = create(:user, :admin)
                product = create(:product)
                sign_in user

                delete "/api/v1/products/#{product.id}/reviews/#{review.id}"
                expect(response).to have_http_status(422)
            end
        end
    end
end