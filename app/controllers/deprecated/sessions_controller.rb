class SessionsController < ApplicationController

    before_action :require_logged_out, only: [:new, :create]
    # we dont want users who are logged in to try to login again
    before_action :require_logged_in, only: [:destroy]
    # we only want logged in users to logout

    def new 
        render :new
    end

    def create 
        user = User.find_by_credentials(params[:user][:username], params[:user][:password])

        if user
            login!(user)
            redirect_to user_url(user)
        else
            flash.now[:errors] = ["Invalid credentails."] # custom error messages can be added
            render :new
        end
    end

    def destroy
        logout!
        flash[:success] = ["Successfully logged out."] # flash.now won't work with redirect!
        redirect_to new_session_url
    end
end