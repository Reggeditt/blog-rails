require 'rails_helper'

RSpec.feature 'Users', type: :feature do
    before do
        @user = create(:user)
        @post = create(:post, author_id: @user.id)
        @post2 = create(:post, author_id: @user.id)
        @post3 = create(:post, author_id: @user.id)
    end

    describe 'users index page' do
        it 'displays users and their posts' do
            visit users_path
            expect(page).to have_content('testuser')
            expect(page).to have_selector('img[src="https://picsum.photos/200"]')
            expect(page).to have_content('Number of posts: 1')
            click_link('testuser', href: user_path(@user.id), wait: 10)
        end
    end

    describe 'user show page' do
        it 'displays user details and posts' do
            visit user_path(@user.id)
            expect(page).to have_selector('img[src="https://picsum.photos/200"]')
            expect(page).to have_content(@user.name)
            expect(page).to have_content("Number of posts: 3", wait: 10)
            expect(page).to have_content(@post.title)
            expect(page).to have_content(@post2.title)
            expect(page).to have_content(@post3.title)
            expect(page).to have_content(@user.bio)
            expect(page).to have_content(@post.text)
            expect(page).to have_content('see all posts')
            click_link(@post.title, href: user_post_path(@user.id, @post.id))
            click_link('see all posts', href: user_posts_path(@user.id))

        end
    end
end