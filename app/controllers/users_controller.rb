class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @study_times = @user.study_times
    @recommends = @user.recommends
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
    # @user.save
    # redirect_to user_path(@user)
  end

  def stop
    @user = User.find(params[:id])
    @user.update(user_params)
    # @user.save
    # redirect_to user_path(@user)
  end

  private
  def user_params
    params.require(:user).permit(:name,:profile_image,:introduction,:is_active)
  end
end
