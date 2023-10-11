class FreeGamesController < ApplicationController
  def index
    # Fetch the FreeGame records from the database
    @free_games = FreeGame.all
  end
end
