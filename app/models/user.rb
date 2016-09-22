class User < ActiveRecord::Base
  VALID_EMAIL
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :password_hash, presence: true, uniqueness: true
  validates :password_salt, presence: true, uniqueness: true
end