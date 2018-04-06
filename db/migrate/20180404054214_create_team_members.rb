class CreateTeamMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :team_members do |t|
      t.integer :team_id
      t.integer :user_id
      add_index(:accounts, [:team_id,:user_id], unique: true)

      t.timestamps
    end
  end
end
