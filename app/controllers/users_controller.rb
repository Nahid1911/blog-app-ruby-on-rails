class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = Post.includes(:author).order(created_at: :desc)
    @recent_posts = @posts.limit(3)
    # @posts = Post.all
  end
end
