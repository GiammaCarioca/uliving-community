class User < ApplicationRecord

  has_many :ads
  has_many :comments
  has_many :bookmarks

  has_secure_password

  # add the photo uploader
  mount_uploader :photo, PhotoUploader

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  
  def to_param
    username
  end

end
