class RoomMessagesController < ApplicationController
    before_action :load_entities

    def index
    end

    def create
      @room_message = RoomMessage.create user: current_user, game: @game,
                                         room: @room,
                                         message: params.dig(:room_message, :message)

                                         RoomChannel.broadcast_to @room, @room_message
    end
  
    protected
  
    def load_entities
      @game = Game.find params.dig(:room_message, :game_id)
      @room = @game.room
    end
end
