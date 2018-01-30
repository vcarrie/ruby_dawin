class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string "title"
      t.date "date_post"
      t.text "chapeau"
      t.text "body"
      t.string "image"
      t.integer "user_id"
      t.timestamps null: false

    end
  end
end
