object @art_request

 attributes :product_id, :customer_id, :id, :art_requested_date, :shipment_date
 
 child(:customer) do 
   attributes :id, :name, :address, :phone, :sage_id
 end

 child(:sales_rep) do 
   attributes :id, :name
 end

 child(:card_art_request) do 
   attributes :id, :name, :design_id, :card_stock_id, :card_type_id
   child(:card_face_specs) do 
     attributes :id, :face_type_id, :color, :ace_id, :joker_id, :card_stock_id, :comments, :card_type_id
   end

   child(:card_back_specs) do 
     attributes :id, :back_type_id, :comments, :color
   end
 end


