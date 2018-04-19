class RoomBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)

    ActionCable.server.broadcast "team_channel#{message.team_id}", message: render_message(message)
end

private
    def render_message(message)
     ApplicationController.renderer.render(partial: 'rooms/room', locals: {room: message})
    end
end
