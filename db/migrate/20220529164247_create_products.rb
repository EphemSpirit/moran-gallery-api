class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :category
      t.decimal :price
      t.string :description

      t.timestamps
    end
  end
end
