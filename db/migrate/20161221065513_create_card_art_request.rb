class CreateCardArtRequest < ActiveRecord::Migration[5.0]
  def change
    create_table :card_art_requests do |t|
      t.string  :name
      t.integer :art_request_id
      t.integer :design_id
      t.integer :card_stock_id
      t.integer :card_type_id
      t.time    :deleted_at
    end
    add_index(:card_art_requests, :art_request_id)
  end
end
