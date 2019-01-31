class ThumbnailUploader < CarrierWave::Uploader::Base
   if Rails.env.production? || Rails.env.staging?
    storage :fog
  else
    storage :file
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end
  # ここでファイル形式を指定する
  def filename
    original_filename if original_filename
  end
end
