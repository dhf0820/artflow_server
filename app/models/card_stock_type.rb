class CardStockType < ApplicationRecord

  def CardStockType.details(designs)
    puts "designs: #{designs.count}"
    #type = CardStockType.order(:name)  # if specific SardStocks for a design this needs to be in the designs loop
    detail = {}
    detail[:prompt] = "Card Stock:"
    detail[:items] = []
    designs.each do |d|
      puts "\n\nWorking with design #{d[:name]}\n\n"
      type = CardStockType.order(:name)  # if specific SardStocks for a design this needs to be in the designs loop
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
