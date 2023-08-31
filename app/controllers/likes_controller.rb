class LikesController < ApplicationController
  def create
    @user = current_user
    @post = Post.find_by(id: params[:post_id])
    @like = @post.likes.build(author_id: @user.id, post_id: @post.id)
    if @like.save
      redirect_to user_post_path(@user, @post)
    else
      render :create
    end
  end

  def destroy; end
end
