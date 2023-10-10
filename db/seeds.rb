# Require necessary libraries
require "httparty"
require "csv"
require "active_record"

# # Delete all exsiting data from game_summaries
# GameSummary.destroy_all

# # Specify the file path to your CSV file
# csv_file = Rails.root.join("db/csv_data/game_summaries_full.csv")

# # Read and create records from the CSV file
# CSV.foreach(csv_file, headers: true) do |row|
#   GameSummary.create!(
#     summary_game_title: row["Title"],
#     game_summary:       row["Summary"]
#   )
# end

# Delete all exsiting data from cheap_games
CheapGame.destroy_all

# # Specify the file path to your CSV file
# csv_file = Rails.root.join("db/csv_data/game_summaries.csv")

# # Read and create records from the CSV file
# CSV.foreach(csv_file, headers: true) do |row|
#   GameSummary.create!(
#     summary_game_title: row["Title"],
#     game_summary:       row["Summary"]
#   )
# end

# Define a method to fetch data from the API
def fetch_giveaways
  response1 = HTTParty.get("https://www.gamerpower.com/api/giveaways") # Replace with your API URL
  JSON.parse(response1.body)
end

# Delete all existing records from the Giveaway table
Giveaway.destroy_all

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
# Fetch data from the API
response2 = HTTParty.get("https://www.cheapshark.com/api/1.0/deals?storeID=1&upperPrice=15")
deals = JSON.parse(response2.body)

# Loop through the API data and create CheapGame records
deals.each do |deal|
  # Find the GameSummary based on the "summary_game_title" attribute
  game_summary = GameSummary.find_by(summary_game_title: deal["title"])
  game_summary_id = game_summary.id if game_summary

  # Create the CheapGame record and associate it with the GameSummary
  CheapGame.create(
    game_summary_id:,
    title:                deal["title"],
    metacritic_link:      deal["metacriticLink"],
    metacritic_score:     deal["metacriticScore"],
    steam_rating_text:    deal["steamRatingText"],
    steam_rating_percent: deal["steamRatingPercent"],
    steam_rating_count:   deal["steamRatingCount"],
    steam_app_id:         deal["steamAppID"],
    thumbnail:            deal["thumb"]
  )
end
