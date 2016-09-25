class AddPasswordConfirmationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :password_confirmation, :string
    add_column :users, :string, :string
  end
end
