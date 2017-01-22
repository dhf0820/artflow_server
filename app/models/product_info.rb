class ProductInfo

  def all_products
    prods = [
        {
            'id': '1',
            'name': 'Casino Cards',
            'designs': [
                {
                    'id': '1',
                    'name': 'Gemaco',
                    'card_stock': [
                        {
                            'id': '1',
                            'name': 'Arjo'
                        },
                        {
                            'id': '2',
                            'name': 'KLOCKNER 12 MIL Plastic'
                        },
                        {
                            'id': '3',
                            'name': 'KLOCKNER 14 MIL Plastic'
                        }
                    ],
                    'card_type': []
                },
                {
                    'id': '2',
                    'name': 'Paulson',
                    'card_stock': [
                        {
                            'id': '1',
                            'name': 'Arjo'
                        },
                        {
                            'id': '2',
                            'name': 'KLOCKNER 12 MIL Plastic'
                        },
                        {
                            'id': '3',
                            'name': 'KLOCKNER 14 MIL Plastic'
                        }
                    ]
                }

            ]
        },
        {
            'id': '2',
            'name': 'Promotional Cards',
        }
    ]
  end
end