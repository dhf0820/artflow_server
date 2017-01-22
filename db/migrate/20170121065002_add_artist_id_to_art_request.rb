class AddArtistIdToArtRequest < ActiveRecord::Migration[5.0]
  def change
    add_column :art_requests, :artist_id, :integer
    add_column :art_requests, :status, :string
    add_index :art_requests, [:artist_id, :status]
    add_index :art_requests, :status
  end
end
