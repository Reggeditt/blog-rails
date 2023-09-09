FactoryBot.define do
  factory :user do
    name { 'testuser' }
    bio { 'testuser@example.com is test users mail.' }
    photo { 'https://picsum.photos/200' }
    posts_counter { 0 }
  end
end
