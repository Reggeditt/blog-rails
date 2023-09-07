class PostsController < ApplicationController
  def index
    @users = User.all
    @user = User.find_by(id: params[:user_id])
    @posts = @user.posts.includes(:recent_comments, :author, :comments).all
  end

  def show
    @post = Post.includes(:author, comments: :author).find(params[:id]) || 'No posts yet'
    @post_comments = Comment.includes(:author).where(post_id: params[:id])
    @user = @post.author
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
