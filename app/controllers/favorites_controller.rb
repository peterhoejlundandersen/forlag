class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    user_id = current_user.id
    title_id = Title.find(params[:title_id])
    favorite = Favorite.new(title_id: title_id, user_id: user_id)
    if favorite.valid? # Haven't been saved before
      favorite.save!
      byebug
    else
      byebug
    end
  end
end
