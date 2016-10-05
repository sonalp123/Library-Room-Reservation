class AddSenderToNotifs < ActiveRecord::Migration
  def change
    add_column :notifs, :sender, :string
  end
end
