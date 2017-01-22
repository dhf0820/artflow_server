class CreateCardBackgroundColors < ActiveRecord::Migration[5.0]  #AA AB
  def change
    create_table :card_background_colors do |t|
      t.integer :design_id
      t.string :color
      t.string :tuck_color
      t.time    :deleted_at
      t.timestamps
    end
    add_index(:card_background_colors, [:design_id, :color], unique: true)
    add_index(:card_background_colors, :deleted_at)
  end
end
