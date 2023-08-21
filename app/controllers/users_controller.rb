class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = 'users'
    # @posts = @user.posts
    @posts = 'posts'
  end
end
