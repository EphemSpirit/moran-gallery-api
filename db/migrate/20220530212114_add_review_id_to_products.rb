class AddReviewIdToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :review_id, :integer
  end
end
