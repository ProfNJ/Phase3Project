class CreateComment < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.integer :author_id
      t.integer :post_id
      t.string :date
      t.string :content
    end

  end
end
