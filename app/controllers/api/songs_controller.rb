class Api::SongsController < ApplicationController
   def index
    # debugger
       @songs = Song.all.includes(:author)
    #    render json: @songs
       render :index
   end

   def create
    # debugger
       @song = Song.new(song_params)
       @song.author = User.first
       # debugger
        if @song.save
            render :show
        else
            render json: @song.errors.full_messages, status: 422
        end   
   end

   def show
    @song = Song.find(params[:id])
    render :show
   end

   private

   def song_params
    # debugger
       params.require(:song).permit(:body)
   end
end