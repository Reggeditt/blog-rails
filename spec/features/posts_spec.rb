require 'rails_helper'

RSpec.feature 'Posts', type: :feature do
  before do
    @user = create(:user)
    @post = create(:post, author_id: @user.id)
  end

  describe 'Index Page' do
    it 'displays posts and user information' do
      # Navigate to the index page
      visit user_posts_path(user_id: @user.id)

      # Use Capybara's matchers to check if content is present
      expect(page).to have_selector('img[src="https://picsum.photos/200"]')
      expect(page).to have_content('testuser')
      expect(page).to have_content('Number of posts: 1')
      expect(page).to have_content('Recent Comments')
      expect(page).to have_content('Post #1')
    end
  end
  