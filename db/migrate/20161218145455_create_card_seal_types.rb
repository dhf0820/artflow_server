class CreateCardSealTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :card_seal_types do |t|
      t.string :name
      t.integer :number
      t.datetime :deleted_at
      t.timestamps
    end
    add_index(:card_seal_types, :name, unique: true)
    add_index(:card_seal_types, :deleted_at)
  end
end
