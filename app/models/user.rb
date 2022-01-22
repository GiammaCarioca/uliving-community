class User < ApplicationRecord
  has_many :ads, dependent: :destroy
  has_many :comments
  has_many :bookmarks, dependent: :destroy
  has_many :group_users
  has_many :groups, through: :group_users

  has_many :author_testimonials, class_name: 'Testimonial', foreign_key: 'author_id'
  has_many :receiver_testimonials, class_name: 'Testimonial', foreign_key: 'receiver_id'

  has_secure_password

  # add the photo uploader
  mount_uploader :photo, PhotoUploader

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  def to_param
    username
  end
end
