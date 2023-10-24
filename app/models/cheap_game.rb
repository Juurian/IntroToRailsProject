class CheapGame < ApplicationRecord
  belongs_to :game_summary
  validates :title, presence: true
  validates :metacritic_link, presence: true
  validates :metacritic_score, presence: true
  validates :steam_rating_text, presence: true
  validates :steam_rating_percent, presence: true
  validates :steam_rating_count, presence: true
  validates :steam_app_id, presence: true
  validates :thumbnail, presence: true
  validates :sale_price, presence: true
  validates :normal_price, presence: true
  validates :savings, presence: true
end
