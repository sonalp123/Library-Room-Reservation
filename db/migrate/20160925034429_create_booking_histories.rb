class CreateBookingHistories < ActiveRecord::Migration
  def change
    create_table :booking_histories do |t|
      t.integer :booking_id
      t.string :username
      t.integer :room_num
      t.integer :start_t
      t.integer :end_t
      t.date :date
      t.string :building
      t.integer :size

      t.timestamps null: false
    end
  end
end
