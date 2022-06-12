class Blog < ApplicationRecord
    belongs_to :user

    validates_with UserValidator
end
