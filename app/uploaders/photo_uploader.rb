class PhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  process resize_to_fit: [150, 150]

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    [version_name, "default_profile_picture.png"].reject(&:blank?).join('_')
  end

  version :thumb_primary do
    process :crop
    process :resize_to_fit => [22, 22]
    process :quality => 100
  end

  version :thumb_secondary do
    process :crop
    process :resize_to_fit => [28, 28]
    process :quality => 100
  end

  def extension_white_list
    %w(jpg jpeg png)
  end

  def content_type_allowlist
    [/image\//]
  end

  def crop
    if model.crop_x.present?
      resize_to_limit(100, 100)
      manipulate! do |img|
        x = model.crop_x.to_i
        y = model.crop_y.to_i
        w = model.crop_w.to_i
        h = model.crop_h.to_i
        img.crop([[w, h].join('x'),[x, y].join('+')].join('+'))
      end
    end
  end
end
