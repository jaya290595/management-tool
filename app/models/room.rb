class Room < ApplicationRecord
  
  def self.find_messages team_id
    @find_room = Room.find_team(team_id)
    @all_messages = []
    @find_room.each do |room|
     @all_messages << room.message
   end
   return @all_messages
  end

  def self.user_name team_id
    @find_user = Room.find_team(team_id)
    @find_user.each do |chat|
      @user_data = User.find(chat.user_id)
      @user_name = @user_data.name

    end
    return @user_name
  end

  def self.find_team team_id
    @find_user = Room.where(team_id: team_id)
  end  
  return @find_user

end
