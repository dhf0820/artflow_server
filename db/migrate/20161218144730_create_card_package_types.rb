class CreateCardPackageTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :card_package_types do |t|
      t.string :name
      t.integer :number
      t.boolean :preshuffle
      t.datetime :deleted_at
      t.timestamps
    end
    add_index(:card_package_types, :name, unique: true)
    add_index(:card_package_types, :deleted_at)
  end
end
