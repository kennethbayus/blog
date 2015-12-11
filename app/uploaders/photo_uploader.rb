class PhotoUploader < CarrierWave::Uploader::Base
  
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    'uploads/'
  end

  version :large do
  	  process resize_to_limit: [800,800]
  end

  version :medium, from_version: :large do
  	process resize_to_limit: [500,500]
  end

  version :thumb, from_version: :medium do
  	process resize_to_limit: [250, 250]
	end


end