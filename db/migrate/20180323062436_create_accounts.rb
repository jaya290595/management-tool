class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.string :account_name
      t.integer :user_id

      t.timestamps
      add_index(:accounts, :account_name, unique: true)
    end
  end
end
