class User < ApplicationRecord
  has_one :researcher

  # Validations
  has_secure_password
  validates :username, presence: true, uniqueness: true, format: {with: /\A^[A-Za-z][A-Za-z0-9_]+$\z/, message: "must only contain letters, numbers, and underscores, and it cannot begin with an underscore"}
  validates :email, uniqueness: true, format: { with: /\A[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info|qa))\z/i, message: "is not a valid format" }
  validates :password, presence: true, confirmation: { message: "does not match" }, length: { minimum: 6, maximum: 18, message: "must be between 6 and 18 characters" }, on: :create
  validates :password_confirmation, presence: true, on: :create
end
