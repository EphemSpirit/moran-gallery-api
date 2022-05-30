class ApplicationController < ActionController::API
    before_action :check_admin

    def check_admin
        if !current_user.admin?
            render status: :unprcoessable_entity
        end
    end
end
