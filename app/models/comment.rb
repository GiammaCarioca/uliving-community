class Comment < ApplicationRecord
  belongs_to :ad

  validates :body, presence: true
end