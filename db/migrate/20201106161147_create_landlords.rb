class CreateLandlords < ActiveRecord::Migration[6.0]
  def change
    create_table :landlords do |t|
      t.string :name
      t.string :phone
      t.string :address
      t.text :description
      t.integer :fields, default: 1

      t.timestamps
    end
  end
end
