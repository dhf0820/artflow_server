class CardDesignType < ApplicationRecord

  def CardDesignType.details()
    designs = CardDesignType.order(:name)
    detail = {}
    detail[:prompt] = 'Designs:'
    detail[:items] = []
    designs.each do |d|
      dt = {}
      dt[:name] = d.name
      dt[:id] = d.id
      detail[:items] << dt
    end
    detail
  end
end
