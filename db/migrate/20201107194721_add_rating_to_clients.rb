class AddRatingToClients < ActiveRecord::Migration[6.0]
  def change
    add_column :clients, :rating, :integer, :default => [0,1,2,3]
  end
end
