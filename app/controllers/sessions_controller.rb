class SessionsController < ApplicationController
  def new
    if session[:current_user_id].present?
      redirect_to api_books_path
    end
  end

  def login
    username = params[:session][:username]
    password = params[:session][:password]
    user = User.find_by(username: username, password: password)

    if user
      session[:current_user_id] = user.id
      redirect_to api_books_path
    end
  end

  def logout
    session.delete(:current_user_id)
    redirect_to new_session_path
  end
end