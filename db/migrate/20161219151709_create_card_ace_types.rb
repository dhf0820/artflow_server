class CreateCardAceTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :card_ace_types do |t|
      t.integer :design_id
      t.string :name
      t.string :photo_file_name
      t.string   :photo_content_type
      t.integer  :photo_file_size
      t.datetime :photo_updated_at
      t.datetime :deleted_at
      t.timestamps
    end
    add_index(:card_ace_types, [:design_id, :name], unique: true)
    add_index(:card_ace_types, :deleted_at)
  end
end
