FactoryBot.define do
    factory :user do
      name { Faker::Name.name }
      posts_counter { 0 }
      # Add other attributes here
    end

    # alias :author, :user
  end
  