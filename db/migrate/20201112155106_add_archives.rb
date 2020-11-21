class AddArchives < ActiveRecord::Migration[6.0]
    def change
      add_column :fruits, :archive, :boolean
      add_column :clients, :archive, :boolean
      add_column :landlords, :archive, :boolean
    end
  end
  