class Ad < ApplicationRecord

  validates :title, presence: true
  validates :body, length: { minimum: 10 }
  validates :studio, numericality: { only_integer: true }
  
end
