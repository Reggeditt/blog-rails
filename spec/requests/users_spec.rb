require 'rails_helper'

describe User, type: :request do
  before do
    @user = User.create(name: 'Sam', photo: 'photo.url', bio: 'Excellent', posts_counter: 0)
  end

  describe 'routes with user_controller' do
    it 'should render the index action correctly' do
      get '/users'
      expect(response).to have_http_status(:success)
      expect(response).to render_template('users/index')
      expect(response).to render_template('layouts/application')
    end

    it 'should render the index content correctly' do
      get '/users'
      expect(response.body).to include('Here are the list of users')
    end

    it 'should render the show action correctly' do
      get '/users/1'
      expect(response).to have_http_status(:success)
      expect(response).to render_template('users/show')
      expect(response).to render_template(layout: 'layouts/application')
    end
    it 'should render the show content correctly' do
      get '/users/1'
      expect(response.body).to include('this is the detail page for the user with id')
    end
  end
end
