class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |c|
      c.integer :user_id
      c.integer :book_id
      c.text :comment
      c.timestamps
    end
  end
end
