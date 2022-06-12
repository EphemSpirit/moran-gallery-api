class CartItem < ApplicationRecord
    belongs_to :product, optional: true
    belongs_to :shipment, optional: true
    belongs_to :cart
end
