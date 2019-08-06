class Reptile < ApplicationRecord
  belongs_to :user
  has_many :posts, through: :users
end
