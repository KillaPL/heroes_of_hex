class SessionsController < ApplicationController
  def create
    session = Session.create
    render json: session
  end
end
