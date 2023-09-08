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

      # check for user profile picture
      expect(page).to have_selector('img[src="https://picsum.photos/200"]')
      # check for user name
      expect(page).to have_content(@user.name)
      # check for number of posts
      expect(page).to have_content('Number of posts: 1')
      # check for post title
      expect(page).to have_content(@post.title)
      # check for post text
      expect(page).to have_content(@post.text)
      # check for post likes
      expect(page).to have_content('likes:')
      # check for post comments
      expect(page).to have_content('comments:')
      # check for comments
      expect(page).to have_content('Recent Comments')
      # check post title link works
      click_link('Post #1', href: user_post_path(@user.id, @post.id))
    end
  end

  describe 'Show Page' do
    it 'displays post details and comments' do
      # Navigate to the show page
      visit user_post_path(user_id: @user.id, id: @post.id)

      # check for post title
      expect(page).to have_content(@post.title)
      # check for post author
      expect(page).to have_content(@user.name)
      # check for post text
      expect(page).to have_content(@post.text)
      # check for post likes
      expect(page).to have_content('likes:')
      # check for post comments
      expect(page).to have_content('comments:')
      # check for like button
      expect(page).to have_button('like this post')
      expect(page).to have_button('Add comment')

      expect(page).to have_content("#{@post.title} by #{@user.name}")
    end
  end
end
