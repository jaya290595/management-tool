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
      
    @member_details = TeamMember.where(team_id: params[:id])
    @member=[]
    @member_details.each do |user|
      @member << User.team_id(user.user_id)
      debugger
    end    
  end

  def add_member
      @account = Account.find_by(user_id: current_user.id)
      @invitation = Invitation.where(account_id: @account.id)
      @member_details = TeamMember.check_member(params[:id])
      @checked_user = @invitation - @member_details
      @user_details = []
      @checked_user.each do |invite|
        @user_details << User.team_id(invite.user_id)
        debugger
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
