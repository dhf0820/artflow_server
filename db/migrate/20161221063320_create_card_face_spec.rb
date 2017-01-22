class CreateCardFaceSpec < ActiveRecord::Migration[5.0]
  def change
    create_table :card_face_specs do |t|
      t.integer :design_id
      t.integer :face_type_id
      t.integer :card_set_id   # while in art this is the CartArtRequest.id
      t.string  :face_art_id  # string includes version F1234.v1
      t.integer :art_set_id   # while in request mode it is teh request
      t.string  :color      # the single color of the face of the card
      t.integer :ace_id     # nil if none
      t.integer :joker_id   # nil if none
      t.integer :card_stock_id
      t.integer :plate_id

      t.text    :comments  # production_notes

      t.string   :art_folder
      t.string   :art_file_name
      t.string   :art_content_type
      t.integer  :art_file_size
      t.datetime :art_updated_at
      t.string   :thumb_nail
      t.time    :deleted_at
      t.timestamps
    end
    add_index(:card_face_specs, :card_set_id)
    add_index(:card_face_specs, :plate_id)
    add_index(:card_face_specs, :face_art_id)
    add_index(:card_face_specs, :deleted_at)

  end
end
