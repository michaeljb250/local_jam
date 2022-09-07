# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

nigel = User.create!(
  email: "nigel@gmail.com",
  password: "bambam1",
  first_name: "Tom",
  last_name: "Jones",
  artist_name: "lil_jonesy",
  address: "10 downing street",
  instrument: "xylophone",
  bio: "hey hey, music is cool"
  )

  jimothy = User.create!(
    email: "jimothy@gmail.com",
    password: "bambam1",
    first_name: "pietro",
    last_name: "sandwich",
    artist_name: "lil_cup",
    address: "1 london road",
    instrument: "maracas",
    bio: "Hi guys, I'm looking for a buddy to jam with sometime! Preferably a pianist, so get in touch!"
  )



    beed = User.create!(
      email: "beedbarnardo@gmail.com",
      password: "bambam1",
      first_name: "beed",
      last_name: "barnard",
      artist_name: "lil_beedy",
      address: "11 langale drive",
      instrument: "xylophone",
      bio: "Just want to play some funky tunes "
    )
