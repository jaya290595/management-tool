class RenameRoomsToMessages < ActiveRecord::Migration[5.1]
  def change
  	def self.up
  	    rename_table :rooms, :messages
  	  end

  	  def self.down
  	    rename_table :messages, :rooms
  	  end
  end
end
