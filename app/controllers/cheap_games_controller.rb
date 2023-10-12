class CheapGamesController < ApplicationController
  def index
    @cheap_games = CheapGame.all

    # Search functionality
    @cheap_games = @cheap_games.where("title LIKE ?", "%#{params[:search]}%") if params[:search]

    # Pagination
    @cheap_games = @cheap_games.paginate(page: params[:page], per_page: 18)
  end
end
