class CreateEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :phone
      t.float :credit, default: 0.0, null: false
      t.text :description
      t.boolean :archive

      t.timestamps
    end
  end
end
