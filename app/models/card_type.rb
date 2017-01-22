class CardType < ApplicationRecord

  def CardType.details(designs)
    #type = CardType.order(:name)  # if nonspecific CardType for a design uncomment this
    detail = {}
    detail[:prompt] = "Card Type:"
    detail[:items] = []
    designs.each do |d|
      type = CardType.order(:name)  # if unspecific CardTypes for a design comment this and uncomment above
      des = {}
      des[:design] = d[:name]
      des[:items] = []
      type.each do |d|
        dt = {}
        dt[:name] = d.name
        dt[:id] = d.id
        des[:items] << dt
      end
      detail[:items] << des
    end
    detail
  end
end
