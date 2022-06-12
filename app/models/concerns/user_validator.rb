class UserValidator < ActiveModel::Validator
    def validate(record)
        if record.user.customer?
           record.errors.add(:base, "user not authorized")
        end
    end
end