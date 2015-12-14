class RoomsController < ApplicationController
  before_filter :authenticated

  def index
    rooms = Room.all
    render json: rooms
  end

  def create
    room = Room.new(room_params)
    if room.valid?
      room.save
      current_session.update(room_id: room.id)
      render json: room
    else
      render json: { errors: room.errors.full_messages }, status: 422
    end
  end

  def leave
    current_session.update(room_id: nil)
    head :ok
  end

  private

  def room_params
    params.require(:room).permit(:name, :point_limit)
  end
end
