class FavoritesController < ApplicationController

  def create
    favorite = current_user.favorites.create(picture_id: params[:picture_id])
    redirect_to pictures_path, notice: "Keep #{favorite.picture.user.name}'s Picture"
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to pictures_path, notice: "Removed #{favorite.blog.user.name}'s Picture from Keep"
  end

  def show
    
  end
  
end
