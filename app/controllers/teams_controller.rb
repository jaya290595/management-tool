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
    # to add members in team
    @team = Team.find(params[:id])
    @account = Account.find_by(user_id: current_user.id)
    @invitation = Invitation.where(account_id: @account.id)
    @user_details = []
    @invitation.each do |invite|
      @user_details << User.team_id(invite.user_id)
    end
    
  #  added members in Team
    @team_member = TeamMember.check_member(params[:id])
    debugger
    @invitation_details=[]
    @team_member.each do |user|
    @invitation_details << User.team_id(user.user_id)
    
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
