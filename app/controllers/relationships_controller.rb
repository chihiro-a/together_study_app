class RelationshipsController < ApplicationController
  before_action :authenticate_user!, only: [:create,:destroy]

  def create
    @user = User.find(params[:id])
    current_user.follow(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    current_user.unfollow(params[:id])
  end
end
