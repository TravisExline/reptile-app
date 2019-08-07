class Reptile < ApplicationRecord
  belongs_to :user
  has_many :posts, through: :users
  validates :name, presence: true
  validates :species, presence: true
  validates :offspring, presence: true
end
