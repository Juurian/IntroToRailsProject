class SearchController < ApplicationController
  def search
    @free_games = FreeGame.all
    @giveaways = Giveaway.all
    @cheap_games = CheapGame.none

    if params[:search].present?
      search_query = "%#{params[:search]}%"
      @free_games = @free_games.where("title LIKE ?", search_query)
      @giveaways = @giveaways.where("title LIKE ?", search_query)
    end

    if params[:platform].present? && params[:platform] != "All Platforms"
      if params[:platform] == "PC"
        @free_games = @free_games.where("platform LIKE ? OR platform LIKE ?", "%PC (Windows)%",
                                        "%PC%")
        @giveaways = @giveaways.where("platforms LIKE ? OR platforms LIKE ?", "%PC (Windows)%",
                                      "%PC%")
      else
        @free_games = @free_games.where("platform LIKE ?", "%#{params[:platform]}")
        @giveaways = @giveaways.where("platforms LIKE ?", "%#{params[:platform]}")
      end
    else
      @cheap_games = CheapGame.all

      if params[:search].present?
        search_query = "%#{params[:search]}%"
        @cheap_games = @cheap_games.where("title LIKE ?", search_query)
      end
    end
  end
end
