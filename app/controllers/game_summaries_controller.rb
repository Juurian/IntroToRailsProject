class GameSummariesController < ApplicationController
  def index
    @game_summaries = if params[:search].present?
                        GameSummary.where("summary_game_title LIKE ?", "%#{params[:search]}%").paginate(
                          page: params[:page], per_page: 20
                        )
                      else
                        GameSummary.paginate(page: params[:page], per_page: 20)
                      end
  end
end
