class Ad < ApplicationRecord

  # add an association that has a 1-to-many relationship
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  # add an association to the user
  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
  validates :category, presence: true

  def to_param
    id.to_s + "-" + title.parameterize
  end
  
end
