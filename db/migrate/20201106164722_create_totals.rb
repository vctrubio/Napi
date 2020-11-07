class CreateTotals < ActiveRecord::Migration[6.0]
  def change
    create_table :totals do |t|
      t.references :payment, null: true, foreign_key: true
      t.references :order, null: true, foreign_key: true
      t.references :pickup, null: true, foreign_key: true
      t.float :inflow
      t.float :outflow
      t.float :balance

      t.timestamps
    end
  end
end
