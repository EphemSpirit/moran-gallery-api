module Error
    class UserNotFoundError < CustomError
        def initialize
            super(422, :user_not_found, 'User not found. Please make sure you email and password are correct!')
        end
    end
end