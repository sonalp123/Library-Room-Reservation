class RemoveSenderFromNotifs < ActiveRecord::Migration
  def change
    remove_column :notifs, :sender, :string
  end
end
