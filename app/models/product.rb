class Product < ApplicationRecord
  #acts_as_paranoid

  # Struct.new('ProductInfo', :name, :id, :data) do
  #
  # end

  def Product.details
    detail = []
    prds = Product.order(:name)
    prds.each do |p|
      dt = {:name => p.name, :id => p.id}
      request_class = p.product_request_class.constantize  #get the product details from the request class
      dt[:items] = request_class.details()
      detail << dt
    end
    detail

  end

  def Product.all_products
    prodinfo = {}
    prds = Product.order(:name)
    prodinfo[:prompt] = 'Products:'
    prodinfo[:data] = []
    prds.each do|p|
      #pi = ProductInfo.new(p.name, p.id)
      pi = Product.set_product_info(p.name, p.id, 'Designs:')
### Product deatils should come from the ProductArtRequest.details


      request_class = p.product_request_class.constantize
      types = request_class.details
      types.each do |t|
        pi[:data] << t
      end
      prodinfo[:data] << pi

    end

    prodinfo
  end


  #
  # Struct.new('ProductElement', :prompt, :table_class, :data) do
  #
  # end
  # Struct.new('DataElement', :name, :id, :data) do
  #
  # end


  # prds = {
  #   prompt to use for pulldown set
  #   data for products [
  #     name: of item  (Casino Cards)
  #     id:   of item in db
  #     data: [ of Each additional selection of this product  eg, Designs for casino cards
  #       {
  #         prompt  Design:
  #         table_name: CardDesignType
  #         data [   Each of the design types found for CardDesign
  #           {
  #             id:  id of design
  #             name:  name of design
  #             data: [ additional items that require user selection
  #
  #             ]
  #           }
  #         ] End of additional data for this item
  #       ]
  #   ]  end of data for products
  #}
  # def all_products
  #   prods = {
  #     'prompt': 'Product:',
  #     'data': [
  #       {  # Casino Cards
  #         'id': '1',
  #         'name': 'Casino Cards',
  #         'data': {
  #           'prompt': 'Design:',
  #           'data': [
  #             {
  #               'id': '1',
  #               'name': 'Gemaco',
  #               'card_stock': {
  #                 'prompt': 'Card Stock',
  #                 'data': [
  #                   {
  #                       'id': '1',
  #                       'name': 'Arjo'
  #                   },
  #                   {
  #                       'id': '2',
  #                       'name': 'KLOCKNER 12 MIL Plastic'
  #                   },
  #                   {
  #                       'id': '3',
  #                       'name': 'KLOCKNER 14 MIL Plastic'
  #                   }
  #                 ]
  #               },
  #               'card_type': []
  #             },
  #             {
  #                 'id': '2',
  #                 'name': 'Paulson',
  #                 'card_stock': [
  #                     {
  #                         'id': '1',
  #                         'name': 'Arjo'
  #                     },
  #                     {
  #                         'id': '2',
  #                         'name': 'KLOCKNER 12 MIL Plastic'
  #                     },
  #                     {
  #                         'id': '3',
  #                         'name': 'KLOCKNER 14 MIL Plastic'
  #                     }
  #                 ]
  #             }
  #
  #           ]
  #         }
  #       },  # End og Casino Cards
  #       { # Promotional Cards
  #         'id': '2',
  #         'name': 'Promotional Cards',
  #       },
  #       { #Chips
  #         'id': '3',
  #         'name': 'Chips'
  #       }
  #     ]
  #   }
  # end

private
  def Product.set_product_info(name, prod_id, prompt)
    pi = {}
    pi[:name] = name
    pi[:id] = prod_id
    pi[:prompt] = prompt
    pi[:data] = []
    pi
  end

end
