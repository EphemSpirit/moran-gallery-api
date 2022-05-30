class Product < ApplicationRecord
    validates :category, :price, :description, presence: true

    scope :jewelry, -> { where("category = ?", "jewelry") }
    scope :embroidery, -> { where("category = ?", "Embroidery") }
    scope :portraiture, -> { where("category = ?", "Portraiture") }
end
