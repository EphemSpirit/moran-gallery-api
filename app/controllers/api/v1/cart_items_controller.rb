class Api::V1::CartItemsController < ApplicationController
  include CurrentCart

  before_action :set_cart, only: [:create]

  def create
      # byebug
      product = Product.find(params[:cart_item][:product_id])
      @cart_item = @cart.add_item(product)

      # binding.pry

      if @cart_item.save
        render json: @cart_item, status: :ok, message: "Item Added to Cart"
      else
        render json: @cart_item.errors, status: :unprocessable_entity, message: "Something went wrong, please try again"
      end
  end

  def destroy
      @cart = Cart.find(session[:cart_id])
      @cart_item.destroy
      render json: { status: :success, message: "Item removed" }
  end

  private

  def cart_item_params
      params.require(:cart_item).permit(:product_id)
  end
end