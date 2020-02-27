class User < ApplicationRecord
  validates :username, presence: true, length: { minimum: 2, maximum: 10 }
  validates :full_name, presence: true, length: { minimum: 2, maximum: 50 }
end
