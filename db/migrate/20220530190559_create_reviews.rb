class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.bigint :star_count
      t.text :content
      t.bigint :user_id

      t.timestamps
    end
  end
end
