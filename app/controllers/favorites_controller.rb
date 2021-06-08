class FavoritesController < ApplicationController
  def create
    @recommend = Recommend.find(params[:recommend_id])
    favorite = current_user.favorites.new(recommend_id: @recommend.id)
    favorite.save
  end

  def destroy
    @recommend = Recommend.find(params[:recommend_id])
    favorite = current_user.favorites.find_by(recommend_id: @recommend.id)
    favorite.destroy
  end
end
