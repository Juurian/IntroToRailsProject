# db/migrate/20231008234828_drop_good_deals.rb

class DropGoodDeals < ActiveRecord::Migration[6.0]
  def change
    drop_table :good_deals
  end
end
