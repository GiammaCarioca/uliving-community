class Bookmark < ApplicationRecord
  belongs_to :ad
  belongs_to :user

  validates :ad, uniqueness: { scope: :user }
end
