require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.create!(author: user, title: 'Post 1', text: 'Some text', comments_counter: 5, likes_counter: 5) }

  let(:user) { User.create!(name: 'John Doe', photo: 'http://placehold.it/300x300', bio: 'some bio', posts_counter: 5) }

  before { subject.save }

  it 'title should be present' do
    post = Post.new(title: nil)
    expect(post).to_not be_valid
  end

  it 'title should not exceed 250 characters' do
    post = Post.new(title: 'a' * 251)
    expect(post).to_not be_valid
  end

  it 'text should be present' do
    post = Post.new(text: nil)
    expect(post).to_not be_valid
  end
end
