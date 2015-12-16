class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :type_contact
      t.string :contact_value
      t.belongs_to :customer, index: true
      t.timestamps null: false
    end
  end
end
