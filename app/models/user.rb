class User < ApplicationRecord
  has_secure_password
  has_many :reptiles
  has_many :posts
  validates :name, presence: true
  validates :name, length: { in: 2..30 }
  validates :name, uniqueness: true
  validates :pet_count, presence: true
end
