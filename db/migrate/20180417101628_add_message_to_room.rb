class AddMessageToRoom < ActiveRecord::Migration[5.1]
  def change
    add_column :rooms, :message, :text
  end
end
