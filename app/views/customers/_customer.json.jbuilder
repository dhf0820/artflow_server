json.extract! customer, :id, :sage_id, :name, :address1, :address2, :address3, :contact_name, :contact_email, :contact_phone, :created_at, :updated_at
json.url customer_url(customer, format: :json)