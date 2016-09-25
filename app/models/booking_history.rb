require 'date'
class BookingHistory < ActiveRecord::Base
  def date_within_week
    if(date > Date.today + 7.days)
      errors.add(:date,"Booking cannot be created for more than a week")
    end
  end
  validates :username, :room_num, :start_t, :end_t, :building, :size, presence: true
  validate :date_within_week


  # def to_param
  #  room_num
  #end
end
