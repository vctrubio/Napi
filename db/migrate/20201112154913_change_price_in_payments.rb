class ChangePriceInPayments < ActiveRecord::Migration[6.0]
  def change
    remove_column :payments, :price
  end
end
