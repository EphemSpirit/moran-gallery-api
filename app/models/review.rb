class Review < ApplicationRecord
    belongs_to :user
    belongs_to :product
    has_many_attached :user_image

    validates :content, :star_count, presence: true
end
