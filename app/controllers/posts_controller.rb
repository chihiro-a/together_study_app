class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    user = current_user
    @post.user_id = user.id
    if @post.save
      flash[:notice] = "ひとりごとを言いました"
      redirect_to user_path(user)
    else
      render new_post_path
    end
  end

  def edit
    @post = Post.find(params[:id])
    if @post.user != current_user
      redirect_to user_path(user)
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "投稿内容を変更しました。"
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "投稿を削除しました。"
    redirect_to user_path(current_user)
  end

  def index
    @posts = Post.all.page(params[:page]).reverse_order.per(5)
  end

  private

  def post_params
    params.require(:post).permit(:body, :image)
  end
end
