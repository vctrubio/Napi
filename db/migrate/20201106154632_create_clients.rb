class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.references :employee, null: false, foreign_key: true
      t.string :name
      t.string :phone
      t.string :address
      t.string :flat
      t.string :zone
      t.text :description
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
