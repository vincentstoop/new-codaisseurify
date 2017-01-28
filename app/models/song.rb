class Song < ApplicationRecord
  belongs_to :artist
  validates :title, presence: true, length: ({maximum: 40})
  validates :year, presence: true,
                   numericality: { only_integer: true,
                     greater_than_or_equal_to: 1900,
                     less_than_or_equal_to: Date.today.year}
end
