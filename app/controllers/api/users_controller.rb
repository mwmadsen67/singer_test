class Api::UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def update
    #TODO
  end

   private
  def user_params
    params.require(:user).permit(:username, :password)
end