class TeamChannel < ApplicationCable::Channel
  def subscribed
  	stream_from "team_channel"  
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
  	Room.create(message: data['message'], user_id: current_user.id, team_id: data['team_id'])
  end
end
