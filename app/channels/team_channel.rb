class TeamChannel < ApplicationCable::Channel
  def subscribed
  	stream_from "team_channel#{params['team_id']}"
  	  
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
  	# @team = Team.find_by_id(data['team_id'])
  	# authorize @team, :create_room?
  	Room.create(message: data['message'], user_id: current_user.id, team_id: data['team_id'], account_id: data['account_id'])
  end
end
