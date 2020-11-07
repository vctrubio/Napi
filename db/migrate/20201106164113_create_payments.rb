class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.date :date
      t.string :name
      t.string :price
      t.boolean :ticket
      t.references :employee, null: true, foreign_key: true

      t.timestamps
    end
  end
end
