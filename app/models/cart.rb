class Cart < ApplicationRecord
    belongs_to :user, optional: true
    has_many :cart_items
    has_many :shipments
    accepts_nested_attributes_for :shipments
end
