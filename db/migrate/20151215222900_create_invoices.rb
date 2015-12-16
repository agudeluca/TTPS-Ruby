class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.string :details
      t.float :amount
      t.date :date
      t.string :reveiver
      t.belongs_to :customer, index: true

      t.timestamps null: false
    end
  end
end
