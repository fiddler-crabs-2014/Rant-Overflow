# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
jared = User.create(email: "jared@gmail.com", password: "jared")
phil = User.create(email: "phil@gmail.com", password: "phil")

2.times do |i|
@user_ids = [1, 2]
  @rant = Rant.create(title: "Do you see any Teletubbies in here?", body: "Do you see a slender plastic tag clipped to my shirt with my name printed on it? Do you see a little Asian child with a blank expression on his face sitting outside on a mechanical helicopter that shakes when you put quarters in it? No? Well, that's what you see at a toy store. And you must think you're in a toy store, because you're here shopping for an infant named Jeb.
", user_id: @user_ids.sample, view_count: 0)
  1.times do |i|
    Response.create(body: "The path of the righteous man is beset on all sides by the iniquities of the selfish and the tyranny of evil men. ", user_id: @user_ids.sample, rant_id: @rant.id)
  end
end
