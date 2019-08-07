class Post < ApplicationRecord
  has_many :reptiles, through: :users
end
