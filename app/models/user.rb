class User < ActiveRecord::Base
  attr_accessible :email, :username

  before_save { |user| user.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: {with: VALID_EMAIL_REGEX}
  validates :username, presence: true, uniqueness: true
  validates :password_hash, presence: true, uniqueness: true
  validates :password_salt, presence: true, uniqueness: true

  def to_param
    username
  end
end