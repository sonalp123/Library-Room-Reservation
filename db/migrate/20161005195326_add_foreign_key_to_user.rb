class AddForeignKeyToUser < ActiveRecord::Migration
  def change
    add_foreign_key :booking_histories, :users, column: :username, primary_key: "username"
  end
end
