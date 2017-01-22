class ArtRequestSpecification < ApplicationRecord
  belongs_to :casino_card_art_request
  belongs_to :card_packaging
  belongs_to :face_style, class_name: 'CardFace'
  belongs_to :card_edge, class_name: 'CardEdge'
  belongs_to :packaging, class_name: 'Packaging', foreign_key: :packaging_type_id

  belongs_to :first_color, class_name: 'CardColor'
  belongs_to :second_color, class_name: 'CardColor'
  belongs_to :third_color, class_name: 'CardColor'
  belongs_to :forth_color, class_name: 'CardColor'
  belongs_to :art_request

  enum card_side_id: ["Face", "Back"]
end
