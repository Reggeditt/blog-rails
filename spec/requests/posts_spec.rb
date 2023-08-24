require 'rails_helper'

describe Post, type: :request do
  before do
    @user = User.create(name: 'Sam', photo: 'photo.url', bio: 'Excellent', posts_counter: 0)
    @post = Post.create(author: @user, title: 'Let us go', text: 'This is the text for the post')
  end

  describe 'routes with post_controller' do
    it 'should render the index action correctly' do
      get "/users/#{@user.id}/posts"
      expect(response).to be_successful
    end
    it 'should render the index action correctly' do
      get "/users/#{@user.id}/posts"
      expect(response.body).to include('This is the list of posts')
    end

    it 'should render the show action correctly' do
      get "/users/#{@user.id}/posts/1"
      expect(response).to be_successful
      expect(response.body).to include('this is your detail page')
    end
  end
end
