class Api::V1::CartsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart

    def show
        @cart = Cart.find(params[:id])
        render json: @cart, status: :ok
    end

    def destroy
        @cart = Cart.find(params[:id])
        @cart.destroy if @cart.id == session[:cart_id]
        session[:cart_id] = nil
        render json: { status: :success, message: "Cart emptied" }
    end

    private

    def invalid_cart
        logger.error "Attmept ot access invalid cart #{params[:id]}"
    end

    def cart_params
        params.require(:cart).permit(:user_id, cart_items: [])
    end
end