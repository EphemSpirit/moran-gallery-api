class CreateCarts < ActiveRecord::Migration[6.1]
  def change
    create_table :carts do |t|
      t.integer :user_id
      t.integer :cart_item_id
      t.integer :shipment_id

      t.timestamps
    end
  end
end
