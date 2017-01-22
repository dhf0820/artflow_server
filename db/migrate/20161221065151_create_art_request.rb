class CreateArtRequest < ActiveRecord::Migration[5.0]
  def change
    create_table :art_requests do |t|
      t.integer :customer_id
      t.integer :sales_rep_id
      t.datetime :art_requested_date
      t.datetime :shipment_date
      t.integer  :product_id
      t.time    :deleted_at
    end
    add_index(:art_requests, :customer_id)
    add_index(:art_requests, :sales_rep_id)
    add_index(:art_requests, :product_id)
    add_index(:art_requests, :deleted_at)
  end
end
