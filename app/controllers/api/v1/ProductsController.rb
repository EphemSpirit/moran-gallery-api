class Api::V1::ProductsController < ApplicationController
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
end