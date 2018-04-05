class TeamsController < ApplicationController
  def new
  end

  def create
    @team = Team.new(teams_params)
    @team.account_id = (Account.where(user_id: current_user.id).first).id
    @team.save
    redirect_to account_path(@team.account_id)
  end  

  def show
    @team = Team.find(params[:id])
    @account = Account.find_by(user_id: current_user.id)
    @invitation = Invitation.where(account_id: @account.id)
    @invitation_details = []
    @invitation.each do |invite|
      @invitation_details << User.find_by_id(invite.user_id)
    end
    @team_member = TeamMember.where(team_id: params[:id])
    @all_users = []
    @team_member.each do |user|
      @all_users << User.find_by_id(user.user_id)
    end
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
    params.require(:team).permit(:team_name)
  end

end
