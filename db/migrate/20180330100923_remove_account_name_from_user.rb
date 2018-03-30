class RemoveAccountNameFromUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :account_name, :string
  end
end
