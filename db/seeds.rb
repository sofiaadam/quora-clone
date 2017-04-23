require 'faker'

30.times do |i|
  User.create(fullname: Faker::Pokemon.unique.name, email: Faker::Internet.unique.safe_email, password: "1234567")
end

20.times do |i|
    id = (1..30).to_a.sample
    Question.create(title: Faker::StarWars.wookie_sentence, user_id: id)
end

20.times do |i|
    id = (1..30).to_a.sample
    Answer.create(answer: Faker::Hobbit.quote, user_id: id)
end