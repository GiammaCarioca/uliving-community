class Ad < ApplicationRecord

  # add an association that has a 1-to-many relationship
  has_many :comments

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
  validates :studio, numericality: { only_integer: true }

  def to_param
    id.to_s + "-" + title.parameterize
  end
  
end
