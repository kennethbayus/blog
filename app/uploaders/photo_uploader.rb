class PhotoUploader < CarrierWave::Uploader::Base
  
  include CarrierWave::MiniMagick

  def content_type_whitelist
    [/image\//]
  end

  storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.slug}"
  end

  process resize_to_limit: [1000,1000]

  version :large do
  	  process resize_to_limit: [700,700]
  end

  version :medium, from_version: :large do
  	process resize_to_limit: [500,500]
  end

  version :small, from_version: :medium do
    process resize_to_limit: [250, 250]
  end

  version :square_250, from_version: :medium do
    process resize_to_fill: [250, 250]
  end

  version :square_thumb, from_version: :small do
  	process resize_to_fill: [80, 80]
	end


end