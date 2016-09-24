class User < ActiveRecord::Base
  attr_accessible :email, :username, :password_hash, :password_salt, :role

  before_save { |user| user.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: {with: VALID_EMAIL_REGEX}
  validates :username, presence: true, uniqueness: true
  validates :password_hash, presence: true
  validates :password_salt, presence: true
  has_secure_password validations: false

  def to_param
    username
  end
end