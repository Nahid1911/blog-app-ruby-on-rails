class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end
  
  def show
    @posts = Post.all
    @post = Post.find params[:id]
    @post_id = @posts.index(@post) + 1
  end

  def new
    @user = User.find(params[:user_id])
    @post = Post.new
  end

  
  def create
    set_current_user
    @post = @current_user.posts.build(post_params)
    @post.comments_counter = 0
     @post.likes_counter = 0
  
    if @post.save
      redirect_to user_post_path(@current_user.id, @post.id), notice: 'Post was successfully Created'
     else
       render :new
     end
  end
  
  private
  
  def post_params
    params.require(:post).permit(:title, :text)
  end

end
