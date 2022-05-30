class Api::V1::ReviewsController < ApplicationController
    skip_before_action :check_admin

    def index
        @reviews = Review.all
        render json: @reviews, status: :ok
    end

    def create
        if !current_api_v1_user.admin?
          @review = current_api_v1_user.reviews.build(review_params)
  
          if @review.save
              render json: { status: :ok, message: "Review posted!" }
          else
              render json: @review.errors, status: :unprocessable_entity
          end
        else
            render status: :unprocessable_entity
        end
        
    end

    def destroy
        if !current_user_or_admin?
            render json: { status: :unprocessable_entity }
        end

        @review = Review.find(params[:id])
        @review.destroy
        render head :no_content
    end

    private

    def review_params
        params.require(:review).permit(:star_count, :content, :user_id, :product_id)
    end

    def current_user_or_admin?
        current_api_v1_user == @review.user || current_user.admin?
    end
end