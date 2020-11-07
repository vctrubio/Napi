class CreateBags < ActiveRecord::Migration[6.0]
  def change
    create_table :bags do |t|
      t.references :pickup, null: false, foreign_key: true
      t.string :type
      t.integer :kg
      t.integer :price
      t.float :avgprice

      t.timestamps
    end
  end
end
