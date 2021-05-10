json.key_format! camelize: :lower
# json.extract! @song, :id, :body, :author_id
json.partial! 'api/songs/song', song: @song