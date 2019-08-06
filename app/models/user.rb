class User < ApplicationRecord
  has_many :reptiles
  has_many :posts
end
