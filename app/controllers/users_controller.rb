class UsersController < ApplicationController

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render ':new'
    end
  end

  def show
    if logged_in
      @user = User.find(session[:user_id])
    else
      redirect_to '/'
    end
  end

  private

  def user_params
    params.require(:user).permit(:admin, :name, :nausea, :happiness, :tickets, :height, :password)
  end
end
