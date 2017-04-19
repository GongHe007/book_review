class AdminController < ApplicationController
  before_action :check_admin_user

  private

  def check_admin_user
    if session[:admin_current_user_id].blank?
      redirect new_session_path
    end
  end
end