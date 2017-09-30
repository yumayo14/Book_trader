class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |book|
      book.string :title
      book.string :category
      book.string :cluster
      book.integer :price
      book.string :author
      book.text :condition
      book.text :detail
      book.timestamps
    end
  end
end
