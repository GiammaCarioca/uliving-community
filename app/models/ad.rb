class Ad < ApplicationRecord

  # add an association that has a 1-to-many relationship
  has_many :comments

  # add an association to the user
  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
  validates :category, presence: true
  validates :name, presence: true
  validates :studio, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 200, less_than_or_equal_to: 1235 }, format: { with: /\A[0-9]{3,4}\z/, message: "only 3 or 4 digits are allowed." }

  def to_param
    id.to_s + "-" + title.parameterize
  end
  
end
