class SessionsController < ApplicationController
  def new
    if session[:admin_current_user_id].present?
      redirect_to admin_books_path
    end
  end

  def login
    binding.pry
  end

  def logout
    session.delete(:admin_current_user_id)
    redirect_to new_session_path
  end
end