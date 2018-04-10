class TeamsController < ApplicationController
  def new
  end

  def create
    @team = Team.new(teams_params)
    @team_account_id = Account.where(id: @team.account_id)
    @team.save
    redirect_to account_path(@team.account_id)
  end  

  def show
  # to add members in team
    @team = Team.find(params[:id])
    @account = Account.find_by(id: @team.account_id)
    @invitation = Invitation.where(account_id: @account.id)
    @member_details = TeamMember.check_member(params[:id])
    @user_details = []
    @invitation.each do |invite|
      @user_details << User.team_id(invite.user_id)
    end  
  #  added members in Team
    @team_member = TeamMember.where(team_id: params[:id])
    @checked_user = []
    @team_member.each do |user|
      @checked_user << User.team_id(user.user_id)
    end
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
