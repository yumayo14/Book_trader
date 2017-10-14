class Book < ActiveRecord::Base

  validates :goods, :title, :category, :cluster, :price, :condition, presence: true

  has_attached_file :goods, styles: { small: "200x200>" }

  validates_attachment_content_type :goods,
                                      content_type: ["image/jpg","image/jpeg","image/png"]

  belongs_to :user
  has_many :comments
end
