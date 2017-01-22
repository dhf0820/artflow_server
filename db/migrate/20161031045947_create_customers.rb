class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.string :sage_id
      t.string :name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :contact_name
      t.string :contact_email
      t.string :contact_phone
      t.integer :sales_rep_id
      t.time   :deleted_at
      t.timestamp
    end
    add_index(:customers, :sage_id, unique: true)
    add_index(:customers, :name)
    add_index(:customers, :sales_rep_id)
    add_index(:customers, :deleted_at)
  end
end
