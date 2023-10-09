class DropDealsTable < ActiveRecord::Migration[6.0]
  def up
    drop_table :deals
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
