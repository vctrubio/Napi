class AddPriceToReceipts < ActiveRecord::Migration[6.0]
  def change
    add_column :receipts, :price, :float
  end
end
