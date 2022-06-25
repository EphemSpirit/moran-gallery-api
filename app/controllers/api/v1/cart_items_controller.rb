class Api::V1::CartItemsController < ApplicationController
  include CurrentCart

  # before_action :set_cart, only: [:create]

  def create
      @cart = current_api_v1_user.cart
      product = Product.find(params[:product_id])
      @cart_item = @cart.add_item(cart_item_params)

      if @cart_item.save
        render json: @cart_item, status: :success, message: "Item Added to Cart"
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
      params.require(:cart_item).permit(:product_id, :cart_id)
  end
end