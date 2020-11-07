class CreateReceipts < ActiveRecord::Migration[6.0]
  def change
    create_table :receipts do |t|
      t.float :kg
      t.references :fruit, foreign_key: true
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
