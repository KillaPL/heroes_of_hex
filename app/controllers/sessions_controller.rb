class SessionsController < ApplicationController
  def create
    session = Session.create
    session.mark_as_alive!
    render json: session
  end

  def update
    session = Session.find_by(value: params[:id])
    if session
      session.mark_as_alive!
      head :ok
    else
      head 404
    end
  end
end
