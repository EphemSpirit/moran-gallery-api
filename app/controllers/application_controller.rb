class ApplicationController < ActionController::API
    #before_action :check_admin
    include CurrentCart

    def check_admin
        if current_user && !current_user.admin?
            render status: :unprocessable_entity
        end
    end
end
