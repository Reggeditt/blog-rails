class CommentsController < ApplicationController
    def new
        @user = current_user
        @post = Post.find_by(id: params[:post_id])
        @post_comment = @post.comments.build(author_id: @user.id)
    end

    def create
        @user = current_user
        @post = Post.find_by(id: params[:post_id])
        @comment = @post.comments.build(author_id: @user.id, post_id: @post.id, **comment_params)
        
        if @comment.save
          redirect_to user_post_path(@user, @post)
        else
          render :new
        end
      end
      
    
    def comment_params
        params.require(:comment).permit(:text)
    end
end