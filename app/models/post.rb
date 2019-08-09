class Post < ApplicationRecord
  belongs_to :user
  has_many :reptiles, through: :users
  validates :title, presence: true
  validates :content, presence: true
end
