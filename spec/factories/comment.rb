  # spec/factories/comment.rb
  FactoryBot.define do
    factory :comment do
      user
      post
      body { Faker::Lorem.paragraph }
    end
  end
  