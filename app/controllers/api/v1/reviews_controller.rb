class Api::V1::ReviewsController < ApplicationController
    skip_before_action :check_admin
    before_action :authenticate_api_v1_user!, except: [:index]

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
        @review = Review.find(params[:id])

        if current_api_v1_user.admin? || @review.user_id != current_api_v1_user.id
            render status: :unprocessable_entity
        else
            @review.destroy
            render status: :ok
        end
    

    end

    private

    def review_params
        params.require(:review).permit(:star_count, :content, :user_id, :product_id)
    end

    # def current_user_or_admin?
    #     current_api_v1_user == @review.user || current_user.admin?
    # end
end