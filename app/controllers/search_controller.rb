class SearchController < ApplicationController
  def search
    @free_games = FreeGame.all
    @giveaways = Giveaway.all
    @cheap_games = CheapGame.all
    search_query = "%#{params[:search]}%"

    # for debugging use
    @debug = ""
    @search_query = "%#{params[:search]}%"
    @platform_query = "%#{params[:platform]}%"

    # if user has text input
    if params[:search].present?
      # if user has text input and select all platforms
      if params[:platform] == "All Platforms"
        @cheap_games = @cheap_games.where("title LIKE ?", search_query)
        @free_games = @free_games.where("title LIKE ?", search_query)
        @giveaways = @giveaways.where("title LIKE ?", search_query)

      # if user has text input and selected PC
      elsif params[:platform] == "PC"
        @cheap_games = @cheap_games.where("title LIKE ?", search_query)
        @free_games = @free_games.where("title LIKE ?", search_query)
        @giveaways = @giveaways.where("title LIKE ?", search_query)

        @free_games = @free_games.where("platform LIKE ? OR platform LIKE ?", "%PC (Windows)%",
                                        "%PC%")
        @giveaways = @giveaways.where("platforms LIKE ? OR platforms LIKE ?", "%PC (Windows)%",
                                      "%PC%")
        @debug = "yes search, platform = all platform, pc, steam"
        # if user has text input and select something other than PC
      else
        @cheap_games = CheapGame.none
        @free_games = @free_games.where("title LIKE ?", search_query)
        @giveaways = @giveaways.where("title LIKE ?", search_query)

        @free_games = @free_games.where("platform LIKE ?", "%#{params[:platform]}%")
        @giveaways = @giveaways.where("platforms LIKE ?", "%#{params[:platform]}%")
        @debug = "yes search, platform != all platform, pc, steam"
      end
    end

    # if user has no text input
    return if params[:search].present?

    # if user has no text input and selected all platforms
    if params[:platform] == "All Platforms"
      @free_games = FreeGame.all
      @giveaways = Giveaway.all
      @cheap_games = CheapGame.all
    # if user has no text input and selected PC
    elsif params[:platform] == "PC"
      @free_games = FreeGame.all
      @free_games = @free_games.where("platform LIKE ? OR platform LIKE ?", "%PC (Windows)%",
                                      "%PC%")
      @giveaways = @giveaways.where("platforms LIKE ? OR platforms LIKE ?", "%PC (Windows)%",
                                    "%PC%")
      @debug = "no search, platform = all platform or pc or steam"
    # if user has no text input and selected something other than PC
    else
      @cheap_games = CheapGame.none
      @free_games = @free_games.where("platform LIKE ?", "%#{params[:platform]}%")
      @giveaways = @giveaways.where("platforms LIKE ?", "%#{params[:platform]}%")
      @debug = "no search, platform != all platform or pc or steam"
    end
  end
end
