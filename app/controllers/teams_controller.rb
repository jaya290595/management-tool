class TeamsController < ApplicationController

  def create
    @team = Team.new(teams_params)
    @team_account_id = Account.where(id: @team.account_id)
    @team.save
    redirect_to account_path(@team.account_id)
  end  

  def show
    # message content
    @all_messages = Room.find_messages(params[:id])
    
    # user name
    @user_name = Room.user_name(params[:id])
    # to add members in team
    @team = Team.find(params[:id])
    @account = Account.find(@team.account_id)
    @invitation = Invitation.where(account_id: @account.id)
    @user_details = Team.invitation(params[:id])

  # added members in Team
    @checked_user = TeamMember.team_member(params[:id])
    @user_for_modal = @user_details - @checked_user
  end

  def check
    @team_id =params[:team][:team_id] 
    @users = params[:ids]
    @users.each do |member|
        TeamMember.create(team_id: @team_id, user_id: member)
    end
  end

private
  def teams_params
    params.require(:team).permit(:team_name, :owner_id, :account_id)
  end

end
