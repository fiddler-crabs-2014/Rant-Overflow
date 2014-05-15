# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
jared = User.create(email: "jared@gmail.com", password: "jared")
phil = User.create(email: "phil@gmail.com", password: "phil")

50.times do |i|
@user_ids = [1, 2]
  @rant = Rant.create(title: "I am post: #{i}", body: "I am body: #{i}", user_id: @user_ids.sample, view_count: 0)
  10.times do |i|
    Response.create(title: " #{i} ) I am response to rant: #{@rant.id}", body: "response number #{i}", user_id: @user_ids.sample, rant_id: @rant.id)
  end
end
