class CreateCardFaceColors < ActiveRecord::Migration[5.0]   # AC AD
  def change
    create_table :card_face_colors do |t|
      t.integer :design_id
      t.string :color
      t.string  :description
      t.time    :deleted_at
      t.timestamps
    end
    add_index(:card_face_colors, [:design_id, :color], unique:true)
    add_index(:card_face_colors, :deleted_at)
  end
end
