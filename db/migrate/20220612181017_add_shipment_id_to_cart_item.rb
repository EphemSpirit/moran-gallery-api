class AddShipmentIdToCartItem < ActiveRecord::Migration[6.1]
  def change
    add_column :cart_items, :shipment_id, :integer
  end
end
