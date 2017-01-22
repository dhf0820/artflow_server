# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])

#   Character.create(name: 'Luke', movie: movies.first)
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'


user = User.new(email: 'dfrench@gpigaming.com', name: 'dfrench', password: '12341234')
if user.save
  user.add_role('super_admin')
  p 'Super Admin Created'
end

csr = User.new(email: 'tenyedi@gpigaming.com', name: 'tenyedi', password: '12341234')
if csr.save
  csr.add_role('csr')
  p 'tenyedi Created'
end

artist = User.new(email: 'artist@vertisoft.com', name: 'art', password: '12341234')
if artist.save
  csr.add_role('artist')
  p 'art Created'
end

gemaco = CardDesignType.new(name: 'Gemaco')
gemaco.save
paulson = CardDesignType.new(name: 'Paulson')
paulson.save

CardType.new(name: 'Bridge').save
CardType.new(name: 'Plastic Proflex Bridge').save
CardType.new(name: 'Plastic Proflex Poker').save
CardType.new(name: 'Plastic Superflex Bridge').save
CardType.new(name: 'Plastic Superflex Poker').save


poker = CardType.new(name: 'Poker')
poker.save
puts 'poker Created'

arjo_stock = CardStockType.new(name: 'Arjo -  Casino', code: 'ARJO', number: 3)
arjo_stock.save
CardStockType.new(name: 'KLOCKNER 12 MIL Plastic').save
CardStockType.new(name: 'KLOCKNER 14 MIL Plastic').save
CardStockType.new(name: 'Koehler Embossed - Traditional Casino', code: 'TRC', number:1).save
CardStockType.new(name: 'Koehler Smooth - Alpha Casino', code: 'ALC', number: 2 ).save
CardStockType.new(name: 'ProFlex Bridge', code: 'PB', number: 6).save
CardStockType.new(name: 'ProFlex Poker', code: 'PP', number: 6).save
CardStockType.new(name: 'SuperFlex Bridge', code: 'SB', number: 6).save
CardStockType.new(name: 'SuperFlex Poker', code: 'SP', number: 6).save


CardPaperType.new(name: '12 MIL Plastic').save
CardPaperType.new(name: '14 MIL Plastic').save
arjo_paper = CardPaperType.new(name: 'ARJO')
arjo_paper.save
CardPaperType.new(name: 'SMOOTH').save
CardPaperType.new(name: 'TRADITIONAL').save

CardEdgeType.new(name: 'Full Bleed',    design_id: gemaco.id).save
CardEdgeType.new(name: 'Infinity Edge', design_id: gemaco.id).save
CardEdgeType.new(name: 'Full Bleed',    design_id: paulson.id).save
CardEdgeType.new(name: 'Soft Edge',     design_id: paulson.id).save

CardPackageType.new(name: 'Single', number: 1, preshuffle: false).save
CardPackageType.new(name: 'Preshuffled-2', number: 2, preshuffle: true).save
CardPackageType.new(name: 'Preshuffled-6', number: 6, preshuffle: true).save
preshuffle_6  = CardPackageType.new(name: 'Preshuffled-8', number: 8, preshuffle: true)
preshuffle_6.save
CardPackageType.new(name: 'GemPack-Preshuffle', number: 1, preshuffle: true).save
CardPackageType.new(name: 'GemPack-Bulk', number: 1, preshuffle: false).save
CardPackageType.new(name: 'GemPack-ShrinkWrap', number: 1, preshuffle: false).save

CardSealType.new(name: '0 Seals', number: 0).save
CardSealType.new(name: '1 Seal', number: 1).save
seals_2 = CardSealType.new(name: '2 Seals', number: 2)
seals_2.save

gemaco_ace = CardAceType.new(design_id: gemaco.id, name: 'Gemaco' )
gemaco_ace.save
CardAceType.new(design_id: gemaco.id, name: 'Alpha').save
CardAceType.new(design_id: gemaco.id, name: 'Eagle').save
CardAceType.new(design_id: gemaco.id, name: 'Custom') .save

gmaco_joker = CardJokerType.new(design_id: gemaco.id, name: 'Gemaco')
gmaco_joker.save
CardJokerType.new(design_id: gemaco.id, name: 'Minman').save
CardJokerType.new(design_id: gemaco.id, name: 'Proflex').save
CardJokerType.new(design_id: gemaco.id, name: 'Superflex').save
CardJokerType.new(design_id: gemaco.id, name: 'Custom').save
CardJokerType.new(design_id: gemaco.id, name: 'None').save

# FaceTypeCodes


CSV.foreach('./db/seed_data/FaceTypeCodes.csv') do |val|
  CardFaceTypeCode.new(code: val[0], desc: val[1], number: val[2]).save
end


# ProductLineCodes
CSV.foreach('./db/seed_data/ProductLineCodes.csv') do |val|
  CardProductLineCode.new(code: val[0], desc: val[1], code_type: val[2]).save
end

#BackTypes
CSV.foreach('./db/seed_data/GemacoBacks.csv') do |val|
  CardBackType.new(design_id: gemaco.id, name: val[0], bleed: val[1]).save
end
CSV.foreach('./db/seed_data/PaulsonBacks.csv') do |val|
  CardBackType.new(design_id: paulson.id, name: val[0], bleed: val[0]).save
end

#ItemNumbers
CSV.foreach('./db/seed_data/ItemNumbers.csv') do |val|
  CardItemNumber.new(item_number: val[0], desc: val[1], product_line: val[2], base: val[3]).save
end

#CardFaceColors
CSV.foreach('./db/seed_data/GemacoFaceColors.csv') do |val|
  CardFaceColor.new(design_id: gemaco.id, color: val[0], description: val[1]).save
end
CSV.foreach('./db/seed_data/PaulsonFaceColors.csv') do |val|
  CardFaceColor.new(design_id: paulson.id, color: val[0], description: val[1]).save
end

#BackColors
CSV.foreach('./db/seed_data/GemacoBackColors.csv') do |val|
  CardBackgroundColor.new(design_id: gemaco.id, color: val[0], tuck_color: val[1]).save
end

CSV.foreach('./db/seed_data/PaulsonBackColors.csv') do |val|
  CardBackgroundColor.new(design_id: paulson.id, color: val[0], tuck_color: val[1]).save
end

# facetypes
CSV.foreach('./db/seed_data/GemacoFaceTypes.csv') do |val|
  CardFaceType.new(design_id: gemaco.id, name: val[0], code: val[1]).save
end

p1 = Product.new(name: 'Casino Cards', product_request_class: 'CardArtRequest')
p1.save


CSV.foreach('./db/seed_data/PaulsonFaceTypes.csv') do |val|
	CardFaceType.new(design_id: paulson.id, name: val[0], code: val[1]).save
end

#customer
# enyedi = Customer.new( name: 'Enyedi Casino', sage_id: '1111')
# enyedi.save

# dhf = Customer.new( name: 'Dhf', sage_id: '1232')
# dhf.save

# sam = SalesRep.new(email: 'Sam@gpigaming.com', name: 'Sam Smith', short_name: 'SS', phone: '555-1212')
# sam.save

# p1 = Product.new(name: 'Casino Cards', product_request_class: 'CardArtRequest')
# p1.save

# #art_request
# req_1 = ArtRequest.new(customer_id: enyedi.id, sales_rep_id: sam.id,  art_requested_date: DateTime.now, product_id:p1.id)
# req_1.save

# req_2 = ArtRequest.new(customer_id: dhf.id, sales_rep_id: sam.id,  art_requested_date: DateTime.now, product_id:p1.id)
# req_2.save

# art_1 = req_1.product_art_request
# art_1.design_id = gemaco.id
# art_1.card_stock_id = arjo_stock.id
# art_1.card_type_id = poker.id
# art_1.save


# art_2 = req_2.product_art_request
# art_2.design_id = gemaco.id
# art_2.card_stock_id = arjo_stock.id
# art_2.card_type_id = poker.id
# art_2.save
# # card art requests
# # art_1 = CardArtRequest.new(art_request_id: req_1, design_id: gemaco.id, card_stock_id: arjo_stock.id, card_type_id: poker.id)
# # art_1.save

# back_type = CardBackType.first
# face_type = CardFaceType.first
# ace_type = CardAceType.first
# joker_type = CardJokerType.first

# face1 = CardFaceSpec.new(design_id: gemaco.id, art_set_id: art_1.id, face_type_id: face_type.id, ace_id: ace_type.id,
#                          joker_id: joker_type.id, color: 'GEM BURGUNDY')
# face1.save
# back1 = CardBackSpec.new(design_id: gemaco.id, art_set_id: art_1.id, back_type_id: back_type.id, color: '208 BURG',
#                          tuck_color: 'RED')
# back1.save

# face2 = CardFaceSpec.new(design_id: gemaco.id, art_set_id: art_2.id, face_type_id: face_type.id, ace_id: ace_type.id,
#                          joker_id: joker_type.id, color: 'GEM BURGUNDY')
# face2.save
# back2 = CardBackSpec.new(design_id: gemaco.id, art_set_id: art_2.id, back_type_id: back_type.id, color: '208 BURG',
#                          tuck_color: 'RED')
# back2.save

