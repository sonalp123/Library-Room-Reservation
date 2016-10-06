class LibraryRoom < ActiveRecord::Base
  #attr_accessible :id, :number, :size, :building
  has_many :booking_histories, :foreign_key => 'room_num',:dependent => :delete_all
  validates :number, presence:true, uniqueness: true
  validates :building, presence:true
  validates :size, presence:true

end
