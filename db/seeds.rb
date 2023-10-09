# db/seeds.rb

# Require necessary libraries
require "httparty"
require "csv"

# Fetch data from the API
response = HTTParty.get("https://www.cheapshark.com/api/1.0/deals?storeID=1&upperPrice=15")
deals_data = JSON.parse(response.body)

# Create records in the Deal model
deals_data.each do |deal|
  GoodDeal.create(
    title:              deal["title"],
    salePrice:          deal["salePrice"],
    normalPrice:        deal["normalPrice"],
    savings:            deal["savings"],
    steamRatingText:    deal["steamRatingText"],
    steamRatingPercent: deal["steamRatingPercent"],
    steamRatingCount:   deal["steamRatingCount"],
    releaseDate:        deal["releaseDate"],
    dealRating:         deal["dealRating"],
    thumb:              deal["thumb"]
  )
end

# Specify the file path to your CSV file
csv_file = Rails.root.join("db/csv_data/game_summaries.csv")

# Read and create records from the CSV file
CSV.foreach(csv_file, headers: true) do |row|
  GameSummary.create!(
    summary_game_title: row["Title"],
    game_summary:       row["Summary"]
  )
end
