class CreateCheapGames < ActiveRecord::Migration[7.0]
  def change
    create_table :cheap_games do |t|
      t.integer :game_id
      t.integer :summary_id
      t.text :title
      t.text :metacritic_link
      t.integer :metacritic_score
      t.text :steam_rating_text
      t.integer :steam_rating_percent
      t.integer :steam_rating_count
      t.integer :steam_app_id
      t.text :thumbnail

      t.timestamps
    end
  end
end
