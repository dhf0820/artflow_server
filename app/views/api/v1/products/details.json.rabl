object false

node(:products) do
  partial('api/v1/products/index', :object => @products)
end

node(:card_design_types) do
  partial('api/v1/card_design_types/index', :object => @designs)
end

node(:card_stock_types) do
  partial('api/v1/card_stock_types/index', :object => @card_stock_types)
end

node(:card_types) do
  partial('api/v1/card_types/index', :object => @card_types)
end