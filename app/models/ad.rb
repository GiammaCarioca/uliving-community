class Ad < ApplicationRecord

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
  validates :studio, numericality: { only_integer: true }

  def to_param
    id.to_s + "-" + title.parameterize
  end
  
end
