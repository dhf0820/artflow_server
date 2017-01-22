json.extract! product, :id, :name, :desc, :product_types_id, :created_at, :updated_at
json.url product_url(product, format: :json)