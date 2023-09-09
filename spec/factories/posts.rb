FactoryBot.define do
  factory :post do
    title { 'Test Post' }
    text { 'This is a test post.' }
    commentscounter { 0 }
    likescounter { 0 } # Corrected the attribute name to lowercase
    association :author, factory: :user # This associates the post with a user

    # This is a callback that will run after the post is created
    after(:create) do |post|
      # this will update the likescounter attribute on the post
      post.update(likescounter: post.likes.count)
      post.update(commentscounter: post.comments.count)
    end
  end
end
