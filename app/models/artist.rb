class Artist < ApplicationRecord
  has_many :songs, dependent: :destroy
  has_many :photos, dependent: :destroy

  validates :name, presence: true, uniqueness: true, length: {maximum: 35}
  validates :bio, length: {maximum: 1000}
end
