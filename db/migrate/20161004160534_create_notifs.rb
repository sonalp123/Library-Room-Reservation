class CreateNotifs < ActiveRecord::Migration
  def change
    create_table :notifs do |t|
      t.string :username
      t.text :message
      t.date :date
      t.string :sender
      t.boolean :read

      t.timestamps null: false
    end
  end
end
