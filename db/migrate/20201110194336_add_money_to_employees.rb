class AddMoneyToEmployees < ActiveRecord::Migration[6.0]
  def change
    add_column :employees, :cash, :float
  end
end
