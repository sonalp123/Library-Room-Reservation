class AddPrimaryKeyToLibraryRoom < ActiveRecord::Migration
  def change
    remove_column :library_rooms, :id
  end
end
