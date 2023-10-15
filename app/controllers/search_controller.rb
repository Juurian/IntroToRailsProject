class SearchController < ApplicationController
  def search
    @cheap_games = CheapGame.all
    @cheap_games = @cheap_games.where("title LIKE ?", "%#{params[:search]}%") if params[:search]

    @free_games = FreeGame.all
    @free_games = @free_games.where("title LIKE ?", "%#{params[:search]}%") if params[:search]

    @giveaways = Giveaway.all
    @giveaways = @giveaways.where("title LIKE ?", "%#{params[:search]}%") if params[:search]
  end
end
