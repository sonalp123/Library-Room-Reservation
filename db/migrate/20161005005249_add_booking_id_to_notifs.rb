class AddBookingIdToNotifs < ActiveRecord::Migration
  def change
    add_column :notifs, :booking_id, :integer
  end
end
