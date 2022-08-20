class Product < ApplicationRecord
    validates :category, :price, :description, presence: true

    scope :jewelry, -> { where("category = ?", "jewelry") }
    scope :embroidery, -> { where("category = ?", "embroidery") }
    scope :portraiture, -> { where("category = ?", "portraiture") }

    has_many :reviews
    has_many :cart_items
end
