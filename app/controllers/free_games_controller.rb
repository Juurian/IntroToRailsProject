class FreeGamesController < ApplicationController
  # def index
  #   # Fetch the FreeGame records from the database
  #   @free_games = FreeGame.all
  # end

  def index
    @free_games = FreeGame.all

    # Search functionality
    @free_games = @free_games.where("title LIKE ?", "%#{params[:search]}%") if params[:search]

    # Pagination
    @free_games = @free_games.paginate(page: params[:page], per_page: 10)
  end
end
