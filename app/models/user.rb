class User < ActiveRecord::Base
  attr_accessible :email, :username, :password, :password_confirmation, :role
 # self.primary_key = 'username'
  has_secure_password
  has_many :booking_histories, :foreign_key => 'username',:dependent => :delete_all
  before_save { |user| user.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  #VALID_EMAIL_REGEX = /\A[\w+\-.]+@ncsu.edu/i
  validates :email, presence: true, uniqueness: true, format: {with: VALID_EMAIL_REGEX}
  validates :username, presence: true, uniqueness: true
  #validates_uniqueness_of :username
  validates :password, presence: true
  validates :password_confirmation, presence: true

  def to_param
    username
  end
end