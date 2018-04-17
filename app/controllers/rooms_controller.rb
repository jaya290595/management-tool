class RoomsController < ApplicationController
  def create
    @room = Room.new(rooms_params)
    @room.team_id = params[:room][:team_id]
    @room.user_id = params[:room][:user_id]
    @room.save
    redirect_to team_path(@room.team_id) 
  end 

  def show
    @room = Room.all
  end


private

def rooms_params
  params.require(:room).permit(:message)
  end

end
