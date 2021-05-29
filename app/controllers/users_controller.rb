class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @study_times = @user.study_times
    @recommends = @user.recommends.page(params[:page]).reverse_order.per(10)
    @users = User.where(is_active:true).limit(3)
    @posts = @user.posts.page(params[:page]).reverse_order.per(5)
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to user_path
  end

  def start
    @user = User.find(params[:id])
    @user.update(user_params)
  end

  def stop
    @user = User.find(params[:id])
    @user.update(user_params)
  end

  def index #勉強中ユーザ一覧
    @users = User.where(is_active:true)
  end

  private
  def user_params
    params.require(:user).permit(:name,:profile_image,:introduction,:is_active)
  end
end
