class FreeGamesController < ApplicationController
  def index
    @free_games = FreeGame.all

    # Search functionality
    @free_games = @free_games.where("title LIKE ?", "%#{params[:search]}%") if params[:search]

    # Genre filter
    if params[:genre].present?
      @free_games = @free_games.where("genre LIKE ?", "%#{params[:genre]}%")
    end

    # Pagination
    @free_games = @free_games.paginate(page: params[:page], per_page: 18)
  end

  def show
    @free_game = FreeGame.find(params[:id])
  end
end
