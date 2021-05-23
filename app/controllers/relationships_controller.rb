class RelationshipsController < ApplicationController
  def create
    relationship = Relationship.new(followed_id:params[:id],following_id:current_user.id)
    relationship.save
    # current_user.follow(params[:id])
    redirect_to root_path
  end
  def destroy
    current_user.unfollow(params[:id])
    redirect_to root_path
  end
end
