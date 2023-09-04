class UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
    @posts = Post.includes(:author)
    @recent_posts = @posts.order(created_at: :desc).limit(3)
    # @posts = Post.all
  end
end
