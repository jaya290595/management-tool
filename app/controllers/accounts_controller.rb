class AccountsController < ApplicationController
  def index
    @account = Account.all_accounts(current_user.id)
  end

  def show
    @user_detail = Invitation.get_invite(params[:id])
    @team = Team.where(account_id: params[:id], owner_id: current_user.id)
    @other_teams = TeamMember.team(current_user.id)    
  end

private

  def account_params
  	 params.require(:account).permit!
  end
end
