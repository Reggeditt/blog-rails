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
    @post_comment = @post.comments.build(author_id: @user.id)
  end

  def new
    @user = current_user
    @post = @user.posts.build
  end

  def create
    @user = current_user
    @post = @user.posts.build(post_params)
    if @post.save
      @user.posts_counter += 1
      @user.save
      redirect_to user_post_path(@user, @post)
    else
      render :new
    end
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
