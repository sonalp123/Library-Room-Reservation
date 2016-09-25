class RemovePasswordSaltFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :password_salt, :string
  end
end
