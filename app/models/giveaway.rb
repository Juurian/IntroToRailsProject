class Giveaway < ApplicationRecord
  belongs_to :game_summary
  validates :title, presence: true
  validates :worth, presence: true
  validates :thumbnail, presence: true
  validates :instructions, presence: true
  validates :giveaway_url, presence: true
  validates :platforms, presence: true
  validates :end_date, presence: true
  validates :status, presence: true
end
