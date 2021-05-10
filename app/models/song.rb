# == Schema Information
#
# Table name: songs
#
#  id         :bigint           not null, primary key
#  body       :text             not null
#  author_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Song < ApplicationRecord
   validates :body, presence: true
   # you don't need to create presence true for foreign keys

   belongs_to :author, 
      primary_key: :id,
      foreign_key: :author_id, #change to composer
      class_name: :User

   has_many :likes, 
      primary_key: :id, 
      foreign_key: :song_id, 
      class_name: :Like

   has_many :likers, 
      through: :likes, 
      source: :liker



    # #Find all songs for a particular user "the_wizard"
    # # User.find_by(username: "the_wizard").songs - less eficiante 
    # Song.joins(:author).where(users: { username: "the_wizard" } )
    # #Find all songs liked by people whose favorite language is JavaScript
    # Song.joins(:likers).where(users: { fav_language: "JavaScript" })
    # #Get only the unique values from the previous query
    # Song.joins(:likers).where("users.fav_language = ?", "JavaScript").distinct
    # #Find all songs with no likes
    # Song.left_outer_joins(:likes).where(likes: { id: nil })
    # #Find how many likes each song has
    # Song.joins(:likes).select(:id, :body, "COUNT(*) AS num_likes").group(:id)
    # #Find songs with at least 3 likes. Show the body and number of likes.  Try to use pluck!
    # Song.joins(:likes).group(:id).having("COUNT(*) >= ?", 3).pluck(:body, "COUNT(*)")

    # Includes #

    # def author_username # fat model - skinny controller
    #     author.username
    # end


    def self.see_song_authors_n_plus_one
        # the "+1"
        songs = Song.all

        # the "N"
        songs.each do |song|
            puts song.author.username
        end

    end

    def self.see_songs_optimized
        # pre-fetches data
        songs = Song.includes(:author).all

        songs.each do |song| 
        # uses pre-fetched data 
            puts song.author.username
        end
    end

    # Joins #

    def self.see_song_num_likes_n_plus_one
        songs = Song.all

        songs.each do |song|
            puts song.likes.length
        end
    end

    def self.see_song_num_likes_optimized
        songs_with_likes = Song
            .select("songs.*, COUNT(*) AS num_likes")
            .joins(:likes)
            .group(:id)
        # debugger
        songs_with_likes.each do |song|
            puts song.num_likes
        end
    end
end
