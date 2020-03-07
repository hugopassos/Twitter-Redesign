class User < ApplicationRecord
  mount_uploader :photo, PictureUploader
  mount_uploader :cover_image, PictureUploader

  has_many :opinions, dependent: :destroy
  has_many :followings
  has_many :inverse_followings, class_name: 'Following', foreign_key: 'following_id'

  validates :username, presence: true, uniqueness: true, length: { minimum: 2, maximum: 10 }
  validates :full_name, presence: true, length: { minimum: 2, maximum: 50 }

  def not_followed_users
    User.where.not(id: User.joins(:inverse_followings).where(followings: { user_id: self.id })).order(created_at: :desc)
  end

  def self.followers(user)
    User.where(id: User.joins(:followings).where(followings: { following_id: user.id }))
  end
end
