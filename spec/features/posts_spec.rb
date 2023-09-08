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

  describe 'Show Page' do
    it 'displays post details and comments' do
      # Navigate to the show page
      visit user_post_path(user_id: @user.id, id: @post.id)

      # Use Capybara's matchers to check if content is present
      expect(page).to have_content('Test Post')
      expect(page).to have_content('testuser')
      expect(page).to have_content('likes:')
      expect(page).to have_content('comments:')
      expect(page).to have_content('This is a test post.')
      expect(page).to have_button('like this post', wait: 10)
      expect(page).to have_button('Add comment')
      # user_post_path(@user.id, post.id)
      click_link('Add comment', href: "/users/#{@user.id}/posts/#{@post.id}/comments")

      expect(page).to have_content('Test Post by testuser')
      expect(page).to have_content('This is a test post.')
    end
  end
end
