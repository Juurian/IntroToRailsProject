class GameSummary < ApplicationRecord
  has_many :cheap_games
  has_many :free_games
  has_many :giveaways
  validates :summary_game_title, presence: true
  validates :game_summary, presence: true
end
