class User < ApplicationRecord
  has_one :researcher

  # Validations
  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates :email, uniqueness: true, format: { with: /\A[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info))\z/i, message: "is not a valid format" }
  validates :password, presence: true, confirmation: { message: "does not match" }, length: { minimum: 6, maximum: 18, message: "must be between 6 and 18 characters" }, on: :create
  validates :password_confirmation, presence: true, on: :create
end
