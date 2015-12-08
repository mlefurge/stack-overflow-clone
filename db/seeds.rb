# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = []
questions = []

10.times do
  users << User.create!(provider: "Google", uid: Faker::Number.number(6), name: Faker::Name.name)
end

10.times do
  users << User.create!(provider: "Facebook", uid: Faker::Number.number(7), name: Faker::Name.name)
end

users.each do |user|
  3.times do
    questions << Question.create!(title: Faker::Lorem.sentence(rand(3..6), true, rand(1..4)), user_id: user.id, content: Faker::Lorem.paragraph(rand(6..12), true, rand(3..6)))
  end
end


questions.each do |question|
  rand(2..5).times do
    question.tags << Tag.find_or_create_by(category: Faker::Lorem.word)
  end
end

