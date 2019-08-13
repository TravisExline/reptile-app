class Post < ApplicationRecord
  belongs_to :reptile
  validates :title, presence: true
  validates :content, presence: true

  def self.from_today
    where("created_at >=?", Time.zone.today.beginning_of_day)
  end

  def self.older
    where("created_at <=?", Time.zone.today.beginning_of_day)
  end
end
