class FollowsController < ApplicationController
  def index
    @follow_users = current_user.following_user
  end

  def timeline
    @follow_users = current_user.following_user
    @posts = Post.where(user_id:@follow_users).order(created_at: "DESC")
  end
end
