class LibraryRoom < ActiveRecord::Base
  validates :number, presence:true, uniqueness: true
  validates :building, presence:true
  validates :size, presence:true

end
