class FavoritesController < ApplicationController
  def create
    @recommend = Recommend.find(params[:recommend_id])
    favorite = current_user.favorites.new(recommend_id: @recommend.id)
    favorite.save
    # redirect_to recommend_path(recommend)
  end

  def destroy
    @recommend = Recommend.find(params[:recommend_id])
    favorite = current_user.favorites.find_by(recommend_id: @recommend.id)
    favorite.destroy
    # redirect_to recommend_path(recommend)
  end
end
