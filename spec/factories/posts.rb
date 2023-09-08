FactoryBot.define do
  factory :post do
    title { 'Test Post' }
    text { 'This is a test post.' }
    commentscounter { 0 }
    likescounter { 0 } # Corrected the attribute name to lowercase
    association :author, factory: :user # This associates the post with a user
  end
end
