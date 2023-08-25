class PostsController < ApplicationController
  def index
    @posts = Post.all
    @user = User.find_by(id: params[:user_id])
    @user_posts = @posts.where(author_id: params[:user_id])
  end

  def show
    @post = Post.find_by(id: params[:id]) || 'No posts yet'
    @post_comments = Comment.all.where(post_id: params[:id])
    @user = User.find_by(id: @post.author_id)
  end
end
