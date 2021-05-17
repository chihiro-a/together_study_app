class RecommendCommentsController < ApplicationController
  def create
    recommend = Recommend.find(params[:id])
    recommend_comment = current_user.recommend_comments.new(recommend_comment_params)
    recommend_comment.recommend_id = recommend.id
    recommend_comment.save
    redirect_to recommend_path(recommend)
  end

  def destroy
  end

  private

  def recommend_comment_params
    params.require(:recommend_comment).permit(:recommend_comment)
  end
end
