class User < ApplicationRecord
  has_secure_password
  has_many :reptiles
  has_many :posts
  validates :name, presence: true
  validates :name, length: { in: 2..30 }
  validates :name, uniqueness: true
  validates :pet_count, presence: true

  def password=(new_password)
    self.password_digest = password_hash(new_password)
  end

  # def authenticate(password)
  #   return nil unless password_hash(password) == password_digest
  #   self
  # end

  private

  def password_hash(input)
    input.bytes.reduce(:+)
  end
end
