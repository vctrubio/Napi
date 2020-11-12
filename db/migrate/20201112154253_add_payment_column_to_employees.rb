class AddPaymentColumnToEmployees < ActiveRecord::Migration[6.0]
  def change
    add_column :employees, :paidcash, :float
    remove_column :employees, :credit
  end
end
