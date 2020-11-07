class CreatePickups < ActiveRecord::Migration[6.0]
  def change
    create_table :pickups do |t|
      t.references :landlord, foreign_key: true
      t.date :date
      t.integer :kg
      t.float :price
      t.text :description

      t.timestamps
    end
  end
end
