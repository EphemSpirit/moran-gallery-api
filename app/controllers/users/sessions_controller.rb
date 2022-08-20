class SessionsController < Devise::SessionsController
    skip_before_action :verify_authenticity_token
    skip_before_action :check_admin

    def create
        @user = User.find_by(email: params[:user][:email])
        if @user
            render json: { email: @user.email, role: @user.role }
        else
            raise UserNotFoundError.new
            render status: :unprocessable_entity
        end
    end
end