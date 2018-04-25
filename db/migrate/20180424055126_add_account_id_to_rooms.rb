class AddAccountIdToRooms < ActiveRecord::Migration[5.1]
  def change
    add_column :rooms, :account_id, :integer
  end
end
