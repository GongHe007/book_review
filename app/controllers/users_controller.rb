class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user_params = params.require(:user).permit(:username, :password, :nikename)
    if User.find_by_username(user_params[:username])
      @notice = "账号已存在"
      render :new
    else
      user = User.new(user_params)
      if user.save
        session[:current_user_id] = user.id
        redirect_to api_books_path
      else
        @notice = "未知错误"
        render :new
      end
    end
  end
end