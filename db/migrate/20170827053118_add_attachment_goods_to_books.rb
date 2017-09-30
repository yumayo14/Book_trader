class AddAttachmentGoodsToBooks < ActiveRecord::Migration
  def self.up
    change_table :books do |t|
      t.attachment :goods
    end
  end

  def self.down
    remove_attachment :books, :goods
  end
end
