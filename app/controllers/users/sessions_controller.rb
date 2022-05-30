class Api::V1::Users::SessionsController < Devise::SessionsController
    def create
        @user = User.find(params[:user][:email])
        if @user
            render json: { email: @user.email, role: @user.role }
        else
            raise UserNotFoundError.new
            render status: :unprocessable_entity
        end
    end
end