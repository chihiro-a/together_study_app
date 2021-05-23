class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    user = current_user
    @post.user_id = user.id
    @post.save
    redirect_to posts_path
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to posts_path
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def index
    @posts = Post.all
  end

  private
  def post_params
    params.require(:post).permit(:body,:image)
  end

end
