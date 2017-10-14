class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar,
                    styles: {large: "128x128#", medium: "100x100#", small: "64x64#"}
  validates_attachment_content_type :avatar,
                                    content_type: ["image/jpg","image/jpeg","image/png"]

  has_many :books
  has_many :comments

end
