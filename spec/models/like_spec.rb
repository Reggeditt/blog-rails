require 'rails_helper'

RSpec.describe Like, type: :model do
  describe '#increment_likes_counter' do
    it 'increments the likes counter of the associated post' do
      user = User.create!(name: 'Taiwo Enoch', posts_counter: 0)
      post = Post.create!(title: 'Post 1', commentscounter: 0, likescounter: 0, author: user)
      like = Like.new(author: user, post: post)

      expect { like.send(:increment_likes_counter) }.to change { post.reload.likescounter }.by(1)
    end
  end

  describe '#decrement_likes_counter' do
    it 'decrements the likes counter of the associated post' do
      user = User.create!(name: 'Taiwo Enoch', posts_counter: 0)
      post = Post.create!(title: 'Post 1', commentscounter: 0, likescounter: 3, author: user)
      like = Like.new(author: user, post: post)

      expect { like.send(:decrement_likes_counter) }.to change { post.reload.likescounter }.by(-1)
    end
  end
end
