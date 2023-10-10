class CreateGiveaways < ActiveRecord::Migration[7.0]
  def change
    create_table :giveaways do |t|
      t.integer :summary_id
      t.string :title
      t.string :worth
      t.string :thumbnail
      t.text :instructions
      t.string :giveaway_url
      t.string :platforms
      t.date :end_date
      t.string :status

      t.timestamps
    end
  end
end
