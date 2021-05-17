class RecommendsController < ApplicationController
  def new
    @recommend = Recommend.new
  end

  def create
    @recommend = Recommend.new(recommend_params)
    @recommend.user_id = current_user.id
    @recommend.save
    redirect_to recommend_path(@recommend.id)
  end

  def show
    @recommend = Recommend.find(params[:id])
  end

  def index
    @recommends = Recommend.all.order(id: "DESC")
  end

  def edit
    @recommend = Recommend.find(params[:id])
  end

  def update
    @recommend = Recommend.find(params[:id])
    @recommend.update(recommend_params)
    redirect_to recommend_path(@recommend.id)
  end

  private
  def recommend_params
    params.require(:recommend).permit(:title,:outher,:publisher,:body)
  end
end
