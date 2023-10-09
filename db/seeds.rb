# db/seeds.rb

# Require necessary libraries
require "httparty"
require "csv"

# # Specify the file path to your CSV file
# csv_file = Rails.root.join("db/csv_data/game_summaries.csv")

# # Read and create records from the CSV file
# CSV.foreach(csv_file, headers: true) do |row|
#   GameSummary.create!(
#     summary_game_title: row["Title"],
#     game_summary:       row["Summary"]
#   )
# end

# Fetch data from the API
FreeGame.destroy_all

response = HTTParty.get("https://www.freetogame.com/api/games")
games_data = JSON.parse(response.body)

games_data.each do |game|
  game_summary = GameSummary.find_by(summary_game_title: game["title"])
  game_summary_id = game_summary.id if game_summary

  FreeGame.create(
    summary_id:   game_summary_id,
    title:        game["title"],
    fdescription: game["short_description"],
    url:          game["game_url"],
    genre:        game["genre"],
    platform:     game["platform"],
    publisher:    game["publisher"],
    release_date: game["release_date"]
  )
end
