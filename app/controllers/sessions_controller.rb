class SessionsController < ApplicationController
  def create
    session = Session.create
    session.mark_as_alive!
    render json: session
  end
end
