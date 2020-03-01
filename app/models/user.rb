class User < ApplicationRecord
  before_create :set_default_images

  mount_uploader :photo, PictureUploader
  mount_uploader :cover_image, PictureUploader

  validates :username, presence: true, length: { minimum: 2, maximum: 10 }
  validates :full_name, presence: true, length: { minimum: 2, maximum: 50 }

  def set_default_images
    self.photo = './assets/images/default-user_6_0.png'
    self.cover_image = './assets/images/24675.png'
  end
end
