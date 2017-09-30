class Book < ActiveRecord::Base

  validates :goods, :title, :category, :cluster, :price, :condition, presence: true

  has_attached_file :goods,
                      styles: { medium: "400x600#", small: "100x150#" }
  validates_attachment_content_type :goods,
                                      content_type: ["image/jpg","image/jpeg","image/png"]

  belongs_to :user
  has_many :comments
end
