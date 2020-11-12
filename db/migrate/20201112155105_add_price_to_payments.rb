class AddPriceToPayments < ActiveRecord::Migration[6.0]
  def change
    add_column :payments, :price, :float
  end
end
