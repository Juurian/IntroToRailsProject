class CreateGameSummaries < ActiveRecord::Migration[7.0]
  def change
    create_table :game_summaries do |t|
      t.string :summary_game_title
      t.string :game_summary

      t.timestamps
    end
  end
end
