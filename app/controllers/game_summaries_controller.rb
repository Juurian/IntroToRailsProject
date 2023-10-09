class GameSummariesController < ApplicationController
  def index
    @game_summaries = GameSummary.paginate(page: params[:page], per_page: 20)
  end
end
