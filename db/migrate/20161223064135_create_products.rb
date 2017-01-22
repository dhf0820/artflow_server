class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :product_request_name
      t.time   :deleted_at
      t.timestamps
    end
    add_index(:products, :name, unique: true)
    add_index(:products, :deleted_at)
  end
end
