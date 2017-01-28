class ImageUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  version :thumbnail do
    eager
    resize_to_fit(400, 300)
    cloudinary_transformation :quality => 80
  end
  version :medium do
    eager
    resize_to_fit(600, 450)
    cloudinary_transformation :quality => 80
  end
end
