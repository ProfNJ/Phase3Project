class CreatePost < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :author
      t.integer :author_id
      t.string :date
      t.string :content
    end
  end
end
