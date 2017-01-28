class Photo < ApplicationRecord
  belongs_to :artist

  mount_uploader :picture, ImageUploader
end
