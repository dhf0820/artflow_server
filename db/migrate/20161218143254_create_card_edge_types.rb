class CreateCardEdgeTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :card_edge_types do |t|
      t.integer  :design_id
      t.string   :name
      t.string   :desc
      t.time     :deleted_at
      t.string   :photo_file_name
      t.string   :photo_content_type
      t.integer  :photo_file_size
      t.datetime :photo_updated_at
      t.timestamps
    end
    add_index(:card_edge_types, [:design_id, :name], unique: true)
    add_index(:card_edge_types, :deleted_at)
  end
end

