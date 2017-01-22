class AddProductRequestNameToArtRequest < ActiveRecord::Migration[5.0]
  def change
    add_column :art_requests, :product_request_class, :string
    rename_column :products, :product_request_name, :product_request_class
  end
end
