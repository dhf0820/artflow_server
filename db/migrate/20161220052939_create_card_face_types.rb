class CreateCardFaceTypes < ActiveRecord::Migration[5.0]  # Y Z
  def change
    create_table :card_face_types do |t|
      t.integer :design_id
      t.string :name
      t.string :code
      t.string   :sample_content_type
      t.integer  :sample_file_size
      t.datetime :sample_updated_at
      t.string   :sample_thumb_nail
      t.time   :deleted_at
      t.timestamps
    end
    add_index(:card_face_types, [:design_id, :name], unique: true)
    add_index(:card_face_types, :deleted_at)
  end
end
