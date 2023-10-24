class FreeGame < ApplicationRecord
  belongs_to :game_summary
  validates :title, presence: true
  validates :url, presence: true
  validates :thumbnail, presence: true
  validates :fdescription, presence: true
  validates :url, presence: true
  validates :genre, presence: true
  validates :platform, presence: true
  validates :publisher, presence: true
  validates :release_date, presence: true
end
