class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params['id'])
    @recent_posts = @user.recent_posts || 'No posts yet'
  end

  def find_user
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    # Handle the situation when the post is not found
    flash[:alert] = 'User not found, back to users page'
    redirect_to users_path
  end
end
