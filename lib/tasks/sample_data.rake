namespace :db do
  desc 'Fill database with sample data'
  task populate: :environment do
    fake_users
    fake_questions
    fake_answers
  end

  def fake_users
    99.times do |n|
      name = Faker::Name.name
      email = "example-#{n+1}@example.com"
      password = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
  end

  def fake_questions
    User.all.each do |user|
      [*0..5].sample.times do |n|
        content = Faker::Lorem.sentence([*8..20].sample).sub('.', '?')
        user.questions.create!(content: content)
      end
    end
  end

  def fake_answers
    200.times do |n|
      question = Question.all.sample
      content = Faker::Lorem.sentence([*8..20].sample)
      Answer.new(content: :content,
                 user: User.all.sample,
                 question: question).save
    end
  end
end
