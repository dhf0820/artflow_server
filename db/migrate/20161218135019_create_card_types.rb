class CreateCardTypes < ActiveRecord::Migration[5.0]    # COLUMN C
  def change
    create_table :card_types do |t|
      t.string :name
      t.time :deleted_at
      t.timestamps
    end
    add_index(:card_types, :name, unique: true)
    add_index(:card_types, :deleted_at)
  end
end
