class AccountsController < ApplicationController
  def index
    	@account = Account.where(user_id: current_user.id).to_a
      @find_invitation = Invitation.where(user_id: current_user.id)
      @find_invitation.each do |invites|
        find_account = Account.find_by(id: invites.account_id)
        @account.push(find_account)
      end
  end

  def new
  end

  def show
    	@account = Invitation.where(account_id: params[:id])
      @user_detail = []
      @account.each do |user|
        @user_detail << User.find_by_id(user.user_id)
      end

      @team = Team.where(account_id: params[:id], owner_id: current_user.id)
      @team_member = TeamMember.where(user_id: current_user.id)
      @other_teams = []
      @team_member.each do |member|
        @other_teams << Team.find_by(id: member.team_id)
      end
    
  end

private

  def account_params
  	 params.require(:account).permit!
  end
end
