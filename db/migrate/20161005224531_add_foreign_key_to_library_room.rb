class AddForeignKeyToLibraryRoom < ActiveRecord::Migration
  def change
    add_foreign_key :booking_histories, :library_rooms, column: :room_num, primary_key: "id"
  end
end
