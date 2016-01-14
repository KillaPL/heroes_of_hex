class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception



  private

  def current_session
    @current_session ||= Session.find_by(value: params[:session_token])
  end

  def authenticated
    not_authenticated if params[:session_token].nil? || current_session.nil?
  end

  def not_authenticated
    head 401
  end
end
