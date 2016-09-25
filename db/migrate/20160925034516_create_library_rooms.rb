class CreateLibraryRooms < ActiveRecord::Migration
  def change
    create_table :library_rooms do |t|
      t.integer :number
      t.string :building
      t.integer :size

      t.timestamps null: false
    end
  end
end
