class Testimonial < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :receiver, class_name: 'User'

  validates :body, presence: true
  validates :author_id, presence: true
  validates :receiver_id, presence: true
end