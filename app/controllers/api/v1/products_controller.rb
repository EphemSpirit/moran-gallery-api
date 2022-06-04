class Api::V1::ProductsController < ApplicationController
    skip_before_action :check_admin, only: [:index]
    before_action :authenticate_api_v1_user!, except: [:index]

    def index
        @products = Product.all
      render json: @products, status: :ok    
    end

    def create
        @product = Product.new(product_params)

        if @product.save
            render json: @product, status: :ok, message: "Product created!"
        else
            render json: @product.errors, status: :unprocessable_entity
        end
    end

    def update
        @product = Product.find(params[:id])
        if @product.update(product_params)
            render json: @product, status: :ok, message: "Product updated successfully!"
        else
            render json: @product.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @product = Product.find(params[:id])
        @product.destroy
        render json: { status: :success, message: "Product deleted!" }
    end

    private

    def product_params
        params.require(:product).permit(:category, :price, :description)
    end

    def check_admin
        if !current_api_v1_user.admin?
            render status: :unprocessable_entity
        end
    end
end