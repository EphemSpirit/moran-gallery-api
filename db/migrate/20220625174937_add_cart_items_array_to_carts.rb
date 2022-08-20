class AddCartItemsArrayToCarts < ActiveRecord::Migration[6.1]
  def change
    remove_column :carts, :cart_item_id
  end
end
