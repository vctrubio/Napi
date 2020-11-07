class CreateFruits < ActiveRecord::Migration[6.0]
  def change
    create_table :fruits do |t|
      t.string :name
      t.float :priceA
      t.float :priceB
      t.float :priceC
      t.string :comment

      t.timestamps
    end
  end
end
