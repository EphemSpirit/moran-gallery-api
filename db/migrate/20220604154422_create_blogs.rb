class CreateBlogs < ActiveRecord::Migration[6.1]
  def change
    create_table :blogs do |t|
      t.text :content
      t.integer :user_id

      t.timestamps
    end
  end
end
