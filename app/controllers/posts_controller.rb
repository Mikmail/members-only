class PostsController < ApplicationController
  before_action :require_user_logged_in!, only: [:new, :create]  
  before_action :set_post, only: [:show]

  def index
    @posts = Post.all
  end
  
  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = Current.user

    if @post.save 
      redirect_to root_path
    else 
      render :new
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params 
    params.require(:post).permit(:title, :body, :user_id)
  end

end
