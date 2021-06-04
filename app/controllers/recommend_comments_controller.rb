class RecommendCommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create,:destroy]

  def create
    @recommend = Recommend.find(params[:recommend_id])
    @recommend_comment = current_user.recommend_comments.new(recommend_comment_params)
    @recommend_comment.recommend_id = @recommend.id
    @recommend_comment.save
    redirect_to recommend_path(@recommend)
  end

  def destroy
    @recommend_comment = RecommendComment.find_by(id: params[:id], recommend_id: params[:recommend_id]).destroy
    redirect_to recommend_path(params[:recommend_id])
  end

  private

  def recommend_comment_params
    params.require(:recommend_comment).permit(:recommend_comment)
  end
end
