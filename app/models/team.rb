class Team < ApplicationRecord
  def self.invitation team
    @team = Team.find(team)
    @account = Account.find_by(id: @team.account_id)
    @invitation = Invitation.where(account_id: @account.id)  
    @member_details = TeamMember.check_member(team)
    @user_details = []
    @invitation.each do |invite|
      @user_details << User.team_id(invite.user_id)
    end
    @user_details 
  end
end
