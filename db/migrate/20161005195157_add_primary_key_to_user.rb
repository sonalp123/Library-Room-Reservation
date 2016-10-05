class AddPrimaryKeyToUser < ActiveRecord::Migration
  def change
    remove_column :users, :id
    execute "ALTER TABLE users ADD PRIMARY KEY (username);"
  end
end
