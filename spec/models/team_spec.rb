require 'rails_helper'

RSpec.describe Team, type: :model do

  describe ".invitation(team)" do
    it "return all invitations" do
        owner =  create :user
        account = (create :account , user_id: owner.id)
        team = (create :team, account_id: account.id)
        user = create :user
        other_account = (create :account, user_id: user.id)
        invite_account = (create :invitation, user_id: user.id, account_id: account.id)
        team_account = Account.find_by(id: team.account_id)
        team_account_invitation = Invitation.where(account_id: team_account.id).pluck(:user_id)
        invitation_users = User.where(id: team_account_invitation)
        invitations = team.invitation
        expect(invitations).to eq(invitation_users)  

    end
  end
end
