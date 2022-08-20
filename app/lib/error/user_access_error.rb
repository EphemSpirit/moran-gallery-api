module Error
    class UserValidator::UserAccessError < CustomError
        def initialize
            super(422, :user_not_authorized, "You don't have access to this feature")
        end
    end
end