require 'rails_helper'

RSpec.describe Team, type: :model do

  describe ".invitation(team)" do
    it "return all invitations" do
        owner =  create :user
        account = (create :account , user_id: owner.id)
        team = (create :team, account_id: owner.id)
        user = create :user
        invited_account = (create :account, user_id: user.id) 
        invite = (create :invitation, account_id: account.id, user_id: user.id)
        invited_user = User.find(user.id)
        members = []
        members << invited_user
        invitations = Team.invitation(team.id)
        expect(invitations).to eq(members)  

    end
  end
end