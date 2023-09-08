require 'rails_helper'

RSpec.feature 'Posts', type: :feature do
  before do
    @user = create(:user)

    @posts = create_list(:post, 3, author_id: @user.id)
    @comments = create_list(:comment, 3, post_id: @posts.first.id, author_id: @user.id)
    @likes = create_list(:like, 3, author_id: @user.id, post_id: @posts.first.id)
  end

  describe 'Index Page' do
    it 'displays posts and user information' do
      # Navigate to the index page
      visit user_posts_path(user_id: @user.id)

      # Check for user profile picture
      expect(page).to have_selector('img[src="https://picsum.photos/200"]')
      # Check for user name
      expect(page).to have_content(@user.name, wait: 100)
      # Check for correct number of posts
      expect(page).to have_content("Number of posts: #{@posts.count}")

      # Check for pagination controls
      expect(page).to have_selector('.pagination')

      # Check if the first post title is present
      expect(page).to have_content(@posts.first.title)

      # Check for post text, likes, comments (for the first post)
      expect(page).to have_content(@posts.first.text)
      expect(page).to have_content("likes: #{@posts.first.likescounter}")
      expect(page).to have_content("comments: #{@posts.first.commentscounter}")

      # Check for recent comments (for the first post)
      expect(page).to have_content('Recent Comments')
      # expect(page).to have_content(@user.name@comments.first.text)
    end
  end

  # Your Show Page test remains unchanged
  describe 'Show Page' do
    it 'displays post details and comments' do
      # Navigate to the show page
      visit user_post_path(user_id: @user.id, id: @posts.first.id)

      # Check for post title
      expect(page).to have_content(@posts.first.title)
      # Check for post author
      expect(page).to have_content(@user.name)
      # Check for post text
      expect(page).to have_content(@posts.first.text)
      # Check for post likes
      expect(page).to have_content("likes: #{@likes.count}")
      # Check for post comments
      expect(page).to have_content("comments: #{@comments.count}")

      # Check for commentor's name on each comment
      @comments.each do |comment|
        expect(page).to have_content(comment.author.name)
        expect(page).to have_content(comment.text)
      end


      # Check for like button
      expect(page).to have_button('like this post')
      expect(page).to have_button('Add comment')

      expect(page).to have_content("#{@posts.first.title} by #{@user.name}")
    end
  end
end
