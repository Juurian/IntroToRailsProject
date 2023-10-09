class CreateGoodDeals < ActiveRecord::Migration[7.0]
  def change
    create_table :good_deals do |t|
      t.string :title
      t.float :salePrice
      t.float :normalPrice
      t.float :savings
      t.string :steamRatingText
      t.float :steamRatingPercent
      t.integer :steamRatingCount
      t.date :releaseDate
      t.float :dealRating
      t.string :thumb

      t.timestamps
    end
  end
end
