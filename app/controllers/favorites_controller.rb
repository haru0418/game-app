class FavoritesController < ApplicationController

  def create
    @game_title = GameTitle.find(params[:game_title_id])
    @favorite = current_user.favorites.create(game_title_id: params[:game_title_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @game_title = GameTitle.find(params[:game_title_id])
    @favorite = current_user.favorites.find_by(game_title_id: @game_title.id)
    @favorite.destroy
    redirect_back(fallback_location: root_path)
  end
end
