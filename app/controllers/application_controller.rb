class ApplicationController < ActionController::Base
    # skip_before_action :verify_authenticity_token # built-in to skip before action / aka csrf protection
    helper_method :current_user, :logged_in?

    def login!(user)
        # debugger
        session[:session_token] = user.reset_session_token
    end

    def current_user
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def logged_in?
        !!current_user
    end

    def logout!
        # debugger
        current_user.reset_session_token if logged_in?
        # debugger
        session[:session_token] = nil
        # debugger
        @current_user = nil
    end

    def require_logged_in
        redirect_to new_session_url unless logged_in?
        # send user to the login form if they are trying to perform 
        # an action that requires them to be logged in
    end

    def require_logged_out
        redirect_to users_url if logged_in?
        # send user to the users index (home page) if they are trying to perform
        # an action that requires them to be logged out
    end
end
