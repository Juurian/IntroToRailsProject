require "httparty"
require "csv"
require "active_record"

Giveaway.destroy_all
CheapGame.destroy_all
FreeGame.destroy_all
GameSummary.destroy_all

########################
##   Giveaway Seed    ##
########################

# Define a method to fetch data from the API
def fetch_giveaways
  response1 = HTTParty.get("https://www.gamerpower.com/api/giveaways") # Replace with your API URL
  JSON.parse(response1.body)
end

# Fetch data from the API and insert new records
giveaways_data = fetch_giveaways

giveaways_data.each do |giveaway|
  game_summary = GameSummary.find_by(summary_game_title: giveaway["title"])
  game_summary_id = game_summary.id if game_summary

  Giveaway.create(
    summary_id:   game_summary_id,
    title:        giveaway["title"],
    worth:        giveaway["worth"],
    thumbnail:    giveaway["thumbnail"],
    instructions: giveaway["instructions"],
    giveaway_url: giveaway["open_giveaway_url"],
    platforms:    giveaway["platforms"],
    end_date:     giveaway["end_date"],
    status:       giveaway["status"]
  )
end

########################
##  Cheap Games Seed  ##
########################

# Fetch data from the API
response2 = HTTParty.get("https://www.cheapshark.com/api/1.0/deals?storeID=1&upperPrice=70")
deals = JSON.parse(response2.body)

deals.each do |deal|
  # Find the GameSummary based on the "summary_game_title" attribute
  game_summary = GameSummary.find_by(summary_game_title: deal["title"])
  game_summary_id = game_summary.id if game_summary

  CheapGame.create(
    game_summary_id:      game_summary_id,
    title:                deal["title"],
    metacritic_link:      deal["metacriticLink"],
    metacritic_score:     deal["metacriticScore"],
    steam_rating_text:    deal["steamRatingText"],
    steam_rating_percent: deal["steamRatingPercent"],
    steam_rating_count:   deal["steamRatingCount"],
    steam_app_id:         deal["steamAppID"],
    thumbnail:            deal["thumb"],
    sale_price:           deal["salePrice"],
    normal_price:         deal["normalPrice"],
    savings:              deal["savings"]
  )
end



########################
##   Free Games Seed  ##
########################

response = HTTParty.get("https://www.freetogame.com/api/games")
games_data = JSON.parse(response.body)

games_data.each do |game|
  game_summary = GameSummary.find_by(summary_game_title: game["title"])
  game_summary_id = game_summary.id if game_summary
  FreeGame.create(
    summary_id:   game_summary_id,
    title:        game["title"],
    thumbnail:    game["thumbnail"],
    fdescription: game["short_description"],
    url:          game["game_url"],
    genre:        game["genre"],
    platform:     game["platform"],
    publisher:    game["publisher"],
    release_date: game["release_date"]
  )
end

########################
##  Game Summary Seed ##
########################

# Specify the file path to your CSV file
csv_file = Rails.root.join("db/csv_data/game_summaries_full.csv")

# Read and create records from the CSV file
CSV.foreach(csv_file, headers: true) do |row|
  GameSummary.create!(
    summary_game_title: row["Title"],
    game_summary:       row["Summary"]
  )
end
