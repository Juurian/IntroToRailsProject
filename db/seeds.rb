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

# Define a method to fetch data from the API
def fetch_giveaways
  response = HTTParty.get("https://www.gamerpower.com/api/giveaways") # Replace with your API URL
  JSON.parse(response.body)
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
