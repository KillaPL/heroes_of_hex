class RoomsController < ApplicationController
  before_filter :authenticated

  def index

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
    # room = Room.create
    # render json: room
  end

  def room_params
    params.require(:room).permit(:name, :point_limit)
  end

end
