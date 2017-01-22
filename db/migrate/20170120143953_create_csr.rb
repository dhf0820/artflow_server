class CreateCsr < ActiveRecord::Migration[5.0]
  def change
    create_table :csrs do |t|
      t.string :name
      t.string :short_name
      t.string :phone
      t.string :email
      t.integer :user_id
      t.timestamps
    end
    add_index :csrs, :name, unique: true
    add_index :csrs, :short_name, unique: true
    add_index :csrs, :user_id, unique: true

  end
end
