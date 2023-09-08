FactoryBot.define do
  factory :like do
    author_id { 1 }
    post

    after(:create) do |like|
      like.post.update(likescounter: like.post.likes.count)
    end
  end
end
