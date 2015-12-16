class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :last_name
      t.date :birthdate
      t.string :genre
      t.integer :document_number
      t.string :cuil_cuit

      t.timestamps null: false
    end
  end
end
