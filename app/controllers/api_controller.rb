class ApiController < ApplicationController
  before_action :check_user

  def current_user_id
    session[:current_user_id]
  end

  private

  def check_user
    if session[:current_user_id].blank?
      redirect_to new_session_path
    end
  end
end