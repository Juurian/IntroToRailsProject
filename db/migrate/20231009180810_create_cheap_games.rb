class CreateCheapGames < ActiveRecord::Migration[7.0]
  def change
    create_table :cheap_games do |t|
      t.references :game_summary,
                   foreign_key: { to_table: :game_summaries, column: :summary_game_title }
      t.string :title
      t.string :metacritic_link
      t.integer :metacritic_score
      t.string :steam_rating_text
      t.integer :steam_rating_percent
      t.integer :steam_rating_count
      t.integer :steam_app_id
      t.string :thumbnail
      t.decimal :sale_price
      t.decimal :normal_price
      t.string :savings

      t.timestamps
    end
  end
end
