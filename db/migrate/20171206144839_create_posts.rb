class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :banner_image
      t.date :published_at
      t.text :description
      t.boolean :published
      t.integer :user_id

      t.timestamps
    end
  end
end
