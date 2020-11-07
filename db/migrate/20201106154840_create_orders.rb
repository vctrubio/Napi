class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :client, null: false, foreign_key: true
      t.date :date
      t.string :time
      t.float :price, default: 0
      t.float :kg, default: 0
      t.string :comment
      t.boolean :paid
      t.boolean :delivered

      t.timestamps
    end
  end
end
