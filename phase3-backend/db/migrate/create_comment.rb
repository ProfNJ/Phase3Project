class CreateComments < ActiveRecord::Migration[6.1]
    def change
      create_table :comments do |t|
        t.string :author
        t.integer :user_id
        t.integer :post_id
        t.string :date
        t.string :content
        
        
  
      end
    end
  end
