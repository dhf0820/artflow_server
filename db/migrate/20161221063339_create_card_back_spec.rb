class CreateCardBackSpec < ActiveRecord::Migration[5.0]
  def change
    create_table :card_back_specs do |t|
      t.integer :design_id
      t.integer :back_type_id
      t.string  :back_art_id  # string includes version B1234.v1
      t.integer :card_set_id  #while in art this is the card_art_request
      t.integer :art_set_id   # while in request mode it is teh request
      t.string  :color
      t.string  :tuck_color
      t.integer :plate_id
      t.text    :comments  #production comments
      t.string  :photo_file_name
      t.string   :art_folder
      t.string   :photo_content_type
      t.integer  :photo_file_size
      t.datetime :photo_updated_at
      t.string   :thumb_nail
      t.time    :deleted_at
      t.timestamps
    end
    add_index(:card_back_specs, :card_set_id)
    add_index(:card_back_specs, :plate_id)
    add_index(:card_back_specs, :back_art_id)
    add_index(:card_back_specs, :deleted_at)
  end
end
