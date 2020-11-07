class AddTitleToBags < ActiveRecord::Migration[6.0]
  def change
    add_column :bags, :name, :string
    remove_column :bags, :type
  end
end
