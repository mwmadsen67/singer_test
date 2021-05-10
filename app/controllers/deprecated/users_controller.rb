class UsersController < ApplicationController

    before_action :require_logged_out, only: [:new, :create]
    # we dont want users who are logged in to try to sign up again
    before_action :require_logged_in, only: [:index, :show]
    # we only want users who are logged in to access the main part of our app

   def index
      @users = User.all
      render :index
  end

  def show
      @user = User.find(params[:id])
      render :show
  end

  def new
      @user = User.new # dummy object so we can prefill partial view
      # debugger
      render :new
  end

  def create
      @user = User.new(user_params) # have access to this variable in whichever view you're referring it to
      # debugger
      if @user.save
          login!(@user)
          redirect_to user_url(@user)
      else
        flash.now[:errors] = @user.errors.full_messages # will be reflected on the view 
        render :new
          # old:
          # render json: @user.errors.full_messages, status: 422
      end
  end

  def edit
      @user = User.find_by(id: params[:id])
      render :edit
  end

  def update
      user = User.find(params[:id])

      if user.update(user_params)
          redirect_to user_url(user)
      else
          render json: user.errors.full_messages, status: 422
      end
  end

  def destroy
      user = User.find(params[:id])

      user.destroy
      redirect_to users_url 
  end

  private

  def user_params
      params.require(:user).permit(:username, :password)
  end
end