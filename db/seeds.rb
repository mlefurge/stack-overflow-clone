# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = []

10.times do
  users << User.create!(provider: "Google", uid: Faker::Number.number(6), name: Faker::Name.name)
end

10.times do
  users << User.create!(provider: "Facebook", uid: Faker::Number.number(7), name: Faker::Name.name)
end

users.each do |user|
  3.times do
    Question.create!(title: Faker::Lorem.sentences(rand(1..3)), user_id: user.id, content: Faker::Lorem.paragraphs(rand(1..4)))
  end
end

