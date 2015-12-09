class PhotoUploader < CarrierWave::Uploader::Base
  storage :file

  def store_dir
    'app/assets/images/'
  end

end