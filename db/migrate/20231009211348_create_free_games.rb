class CreateFreeGames < ActiveRecord::Migration[7.0]
  def change
    create_table :free_games do |t|
      t.integer :summary_id
      t.string :title
      t.text :fdescription
      t.string :url
      t.string :genre
      t.string :platform
      t.string :publisher
      t.date :release_date

      t.timestamps
    end
  end
end
