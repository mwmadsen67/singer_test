class SongsController < ApplicationController

    before_action :require_logged_in, only: [:new, :create, :edit, :update]

    # SongsController for songs table
    def index # returns all songs
        # cf. @songs -> used for "view"
        # @songs = Songs.all too many queries N+1
        @songs = Song.all.includes(:author) # activerecord method
        
        render :index  # bundle exec rails server -> open server -> http://localhost:3000/songs
    end

    def show # takes id and returns 1 song
        @song = Song.includes(:author, :likers).find(params[:id]) # ORDER! 

        render :show
    end

    def new
        @song = Song.new # empty song instance
        render :new
    end

    def create
        @song = Song.new(song_params)
        @song.author = current_user
 
        if @song.save
            redirect_to song_url(@song) # @song.id with rails magic!
            # redirect_to creates a new request and response cycle; redirect knows by default that we’re making a GET request
        else 
            # render json: @song.errors.full_messages, status: 422 # you can put custom error messages; cf. status codes 
            flash[:errors] = @song.errors.full_messages
            render :new, status: 422
        end
    end

    def edit
        @song = Song.find(params[:id])
        render :edit
    end

    def update
      song = Song.find(params[:id])
  
      if song.update(song_params)
        redirect_to song_url(song) # or song.id; redirect_to will know that this is a GET request
      else
        flash.now[:errors] = song.errors.full_messages
        render :edit, status: 422
      end
    end

    def destroy
        song = Song.find(params[:id])

        song.destroy
        redirect_to songs_url
    end

    def song_params
        params.require(:song).permit(:body)
    end
    
end