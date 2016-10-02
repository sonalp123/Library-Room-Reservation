class LibraryRoom < ActiveRecord::Base
  validates :number, presence:true
  validates :building, presence:true
  validates :size, presence:true

end
