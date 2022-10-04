class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all 
  end
  
  def show 
  end

  def new
    @post = Post.new
  end

  def create
    @post = Posts.new(post_params)
    @post.user_id = @signed_in_user.id

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

  def authenticate_user!
    http_basic_authenticate_or_request_with name: "dhh", password: "secret"
  end

  def post_params 
    params.require(:post).permit(:title, :body)
  end

end
