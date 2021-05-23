class RelationshipsController < ApplicationController
  def create
    user = User.find(params[:id])
    relationship = Relationship.new(followed_id: params[:id], following_id: current_user.id)
    relationship.save
    # Relationship.create(followed_id:params[:id],following_id:current_user.id)
    # current_user.follow(params[:id])
    # current_user.follow(params[:id])
    redirect_to user_path(user.id)
  end
  def destroy
    user = User.find(params[:id])
    # current_user.unfollow(params[:id])
    relationship = Relationship.find_by(followed_id: params[:id], following_id: current_user.id)
    relationship.destroy
    redirect_to user_path(user.id)
  end
end
