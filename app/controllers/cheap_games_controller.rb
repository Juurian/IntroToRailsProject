# app/controllers/cheap_games_controller.rb

class CheapGamesController < ApplicationController
  def index
    @cheap_games = CheapGame.all
  end
end
