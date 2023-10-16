class GameSummary < ApplicationRecord
  has_many :cheap_games
  has_many :free_games
  has_many :giveaways
end
