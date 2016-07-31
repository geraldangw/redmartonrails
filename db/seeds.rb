# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name:  "Gerald Ang",
             email: "geraldangw@gmail.com",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

(0..85).each do |i|
    User.create(name: Faker::Superhero.name, email: Faker::Internet.email,
    password: "test1234",
    password_confirmation: "test1234",
    activated: true,
    activated_at: Time.zone.now)
end

(0..10).each do |f|
Micropost.create!(content: Faker::Hipster.sentence,
                  user_id: 1)
                end

(0..10).each do |j|
Micropost.create!(content: Faker::Hipster.sentence,
                  user_id: 2 )
                end

(0..10).each do |x|
Micropost.create!(content: Faker::Hipster.sentence,
                  user_id: 3 )
                end

# Following relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
