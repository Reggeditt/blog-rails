require 'rails_helper'
require 'shoulda/matchers'

RSpec.describe Post, type: :model do
  it { should belong_to(:author).class_name('User') }
  it { should have_many(:comments).dependent(:destroy) }
  it { should have_many(:likes).dependent(:destroy) }

  it { should validate_presence_of(:title) }
  it { should validate_length_of(:title).is_at_most(250) }
  it { should validate_numericality_of(:commentscounter).only_integer.is_greater_than_or_equal_to(0) }
  it { should validate_numericality_of(:likescounter).only_integer.is_greater_than_or_equal_to(0) }

  describe '#recent_comments' do
    it 'returns the 5 most recent comments' do
      user = User.create!(name: 'Taiwo Enoch', posts_counter: 0)
      post = user.posts.create!(title: 'Post 1', commentscounter: 0, likescounter: 0)

      comment1 = Comment.create!(text: 'This is the first comment', created_at: 1.day.ago, post:, author: user)
      comment2 = Comment.create!(text: 'This is the second comment', created_at: 2.days.ago, post:, author: user)
      comment3 = Comment.create!(text: 'This is the third comment', created_at: 3.days.ago, post:, author: user)
      comment4 = Comment.create!(text: 'This is the fourth comment', created_at: 4.days.ago, post:, author: user)
      comment5 = Comment.create!(text: 'This is the fifth comment', created_at: 5.days.ago, post:, author: user)
      Comment.create!(text: 'This is the sixth comment', created_at: 6.days.ago, post:, author: user)

      recent_comments = post.recent_comments

      expect(recent_comments.pluck(:id)).to eq([comment1.id, comment2.id, comment3.id, comment4.id, comment5.id])
    end
  end

  describe '#increment_author_posts_counter' do
    it 'increments the author posts counter' do
      user = User.create!(name: 'Taiwo Enoch', posts_counter: 0)
      post = user.posts.create!(title: 'Post 1', commentscounter: 0, likescounter: 0)

      expect { post.send(:increment_author_posts_counter) }.to change { user.reload.posts_counter }.by(1)
    end
  end

  describe '#decrement_author_posts_counter' do
    it 'decrements the author posts counter' do
      user = User.create!(name: 'Taiwo Enoch', posts_counter: 1)
      post = user.posts.create!(title: 'Post 1', commentscounter: 0, likescounter: 0)

      expect { post.send(:decrement_author_posts_counter) }.to change { user.reload.posts_counter }.by(-1)
    end
  end

  describe 'validations' do
    let(:post) { Post.new }

    it 'likescounter should be greater than or equal to 0' do
      post.likescounter = 0
      expect(post).to_not be_valid
    end
  end

  describe '#increment_likes_counter' do
    it 'increments the likes counter of the associated post' do
      user = User.create!(name: 'Tk', posts_counter: 0)
      post = Post.create!(title: 'Post 1', author: user, commentscounter: 0, likescounter: 0)
      like = Like.new(author: user, post:)

      expect { like.send(:increment_likes_counter) }.to change { post.reload.likescounter }.by(1)
    end
  end

  describe '#decrement_likes_counter' do
    it 'decrements the likes counter of the associated post' do
      user = User.create!(name: 'Tk', posts_counter: 0)
      post = Post.create!(title: 'Post 1', author: user, commentscounter: 0, likescounter: 1)
      like = Like.new(author: user, post:)

      expect { like.send(:decrement_likes_counter) }.to change { post.reload.likescounter }.by(-1)
    end
  end
end
