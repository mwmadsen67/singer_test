# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Like.destroy_all
Song.destroy_all
User.destroy_all

# Users
paloma = User.create!(username: "awesome_person", password: "starwars")
ara = User.create!(username: "aratist", password: "starwars")
daniel = User.create!(username: "dan_the_man", password: "starwars")
megan = User.create!(username: "the_wizard", password: "starwars")
valerie = User.create!(username: "talk_to_the_hand", password: "starwars")
justin = User.create!(username: "justin_gets_buckets", password: "starwars")
dane = User.create!(username: "beep_boop", password: "starwars")
big_company = User.create!(username: "instructors_rock", password: "notstarwars")



# Songs
song1 = Song.create!(author_id: daniel.id, body: "Please use my messaging app, it's way better than Slack.")
song2 = Song.create!(author_id: big_company.id, body: "Hello fellow instructors.")
song3 = Song.create!(author_id: big_company.id, body: "Have you seen this sweet instructor merch?")
song4 = Song.create!(author_id: paloma.id, body: "Sweeeeeet.")
song5 = Song.create!(author_id: megan.id, body: "Kahoots are an opportunity to mess with students.")

song6 = Song.create!(author_id: ara.id, body: "Raaaaaiiiils.")
song7 = Song.create!(author_id: megan.id, body: "This is a random quote I found online. -Some person, 2020.")
song8 = Song.create!(author_id: paloma.id, body: "JavaScript is the best coding language.")

song9 = Song.create!(author_id: daniel.id, body: "Programmer: A machine that turns coffee into code.")
song10 = Song.create!(author_id: big_company.id, body: "You're a wizard, instructor.")


# Likes

# megan
Like.create!(liker_id: megan.id, song_id: song1.id)
Like.create!(liker_id: megan.id, song_id: song4.id)
Like.create!(liker_id: megan.id, song_id: song6.id)
Like.create!(liker_id: megan.id, song_id: song8.id)
Like.create!(liker_id: megan.id, song_id: song9.id)

# daniel
Like.create!(liker_id: daniel.id, song_id: song6.id)
Like.create!(liker_id: daniel.id, song_id: song7.id)
Like.create!(liker_id: daniel.id, song_id: song8.id)
Like.create!(liker_id: daniel.id, song_id: song4.id)

# ara
Like.create!(liker_id: ara.id, song_id: song4.id)
Like.create!(liker_id: ara.id, song_id: song5.id)
Like.create!(liker_id: ara.id, song_id: song8.id)

# paloma
Like.create!(liker_id: paloma.id, song_id: song5.id)
Like.create!(liker_id: paloma.id, song_id: song6.id)

# Big Company
Like.create!(liker_id: big_company.id, song_id: song1.id)
Like.create!(liker_id: big_company.id, song_id: song4.id)
Like.create!(liker_id: big_company.id, song_id: song5.id)
Like.create!(liker_id: big_company.id, song_id: song6.id)
Like.create!(liker_id: big_company.id, song_id: song7.id)
Like.create!(liker_id: big_company.id, song_id: song8.id)
Like.create!(liker_id: big_company.id, song_id: song9.id)