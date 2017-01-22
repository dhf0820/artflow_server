class CreateCardDesignTypes < ActiveRecord::Migration[5.0]     # column B
  def change
    create_table :card_design_types do |t|
      t.string :name
      t.time :deleted_at
      t.timestamps
    end
    add_index(:card_design_types, :name, unique: true)
    add_index(:card_design_types, :deleted_at)
  end
end
