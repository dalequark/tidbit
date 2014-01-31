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
      biography = Faker::Lorem.sentence(6)
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password,
                   bio: biography)
    end
  end

  def fake_questions
    User.all.each do |user|
      [*0..5].sample.times do |n|
        title = Faker::Lorem.sentence([*5..10].sample).sub('.', '?')
        content = Faker::Lorem.sentence([*8..20].sample)
        user.questions.create!(
            title: title,
            content: content)
      end
    end
  end

  def fake_answers
    200.times do |n|
      question = Question.all.sample
      content = Faker::Lorem.sentence([*8..20].sample)
      Answer.create!(content: content,
                     user: User.all.sample,
                     question: question)
    end
  end
end
