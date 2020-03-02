class User < ApplicationRecord
  before_save :set_default_images

  mount_uploader :photo, PictureUploader
  mount_uploader :cover_image, PictureUploader

  validates :username, presence: true, length: { minimum: 2, maximum: 10 }
  validates :full_name, presence: true, length: { minimum: 2, maximum: 50 }

  def set_default_images
    File.open(File.join(Rails.root, 'app', 'assets', 'images', 'default-user_6_0.png')) do |f|
      self.photo = f
    end

    File.open(File.join(Rails.root, 'app', 'assets', 'images', '24675.jpg')) do |f|
      self.cover_image = f
    end
  end
end
