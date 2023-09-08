FactoryBot.define do
  factory :comment do
    author_id { 1 }
    post_id { 1 }
    text { 'This is a test comment.' }
  end
end
