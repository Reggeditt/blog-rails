class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params['id'])
    @posts = Post.all || 'No posts yet'
    @post = []
    @posts.each do |post|
      @post << post if post.author_id == @user.id
    end
  end
end
