# json.array! @songs do |song| 
#    json.body song.body
#    always give a key of "body"
# end

json.key_format! camelize: :lower
# json.array! @songs, :id, :body, :author_id

@songs.each do |song|
    json.songs do
        # set key dynamically
        json.set! song.id do 
            json.partial! 'api/songs/song', song: song
            # json.author song.author.username
        end
    end
    json.users do
        json.set! song.author_id do
            json.extract! song.author, :id, :username
        end
    end
end