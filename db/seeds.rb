# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Episode.destroy_all
Segment.destroy_all

# me = User.create(username: "shaq", password: "0077")
# me.episodes.create(title: "whoa dude", air_date: "01/25/25")