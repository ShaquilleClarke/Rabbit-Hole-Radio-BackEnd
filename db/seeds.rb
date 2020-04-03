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

User.create(username: "yeezus sheist", password: "000")

Episode.create(title: "demo", air_date: "1/25/20", user_id: User.first.id)

Segment.create(title: "adzzz", episode_id: Episode.first.id)