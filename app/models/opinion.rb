class Opinion < ApplicationRecord
  belongs_to :user

  validates :text, presence: true
  validates :text, length: { maximum: 280 }

  scope :most_recent, -> { order('created_at DESC') }
end
