class AddQuantityToProduct < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :quanity, :bigint
  end
end
