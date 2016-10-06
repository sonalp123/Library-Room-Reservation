class AddIdToLibraryRoom < ActiveRecord::Migration
  def change
      add_column :library_rooms ,:id, :integer
      execute "ALTER TABLE library_rooms ADD PRIMARY KEY (id);"
  end
end
