require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe '#increment_comments_counter' do
    it 'increments the comments counter of the associated post' do
      user = User.create!(name: 'Taiwo Enoch', posts_counter: 0)
      post = Post.create!(title: 'Post 1', author: user, commentscounter: 0, likescounter: 0)
      comment = Comment.new(text: 'This is a comment', author: user, post: post)

      expect { comment.send(:increment_comments_counter) }.to change { post.reload.commentscounter }.by(1)
    end
  end
  describe '#decrement_comments_counter' do
    it 'decrements the comments counter of the associated post' do
      user = User.create!(name: 'Taiwo Enoch', posts_counter: 0)
      post = Post.create!(title: 'Post 1', commentscounter: 3, likescounter: 0, author: user)
      comment = Comment.new(text: 'This is a comment', author: user, post: post)

      expect { comment.send(:decrement_comments_counter) }.to change { post.reload.commentscounter }.by(-1)
    end
  end
end
