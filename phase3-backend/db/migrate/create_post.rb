class CreatePosts < ActiveRecord::Migration[6.1]
    def change
      create_table :posts do |t|
        t.string :author
        t.integer :user_id
        t.string :date
        t.string :content
        t.integer :likes
      end
    end
  end
  