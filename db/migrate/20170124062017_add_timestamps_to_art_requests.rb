class AddTimestampsToArtRequests < ActiveRecord::Migration[5.0]
  def change
    add_column :art_requests, :created_at, :timestamp
    add_column :art_requests, :updated_at, :timestamp
  end
end
