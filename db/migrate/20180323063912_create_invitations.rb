class CreateInvitations < ActiveRecord::Migration[5.1]
  def change
    create_table :invitations do |t|
      t.integer :account_id
      t.integer :user_id

      t.timestamps
      add_index(:invitations, [:account_id, :user_id], unique: true)
    end
  end
end
