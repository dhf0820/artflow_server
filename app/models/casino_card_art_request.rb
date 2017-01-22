class CasinoCardArtRequest < ApplicationRecord
  has_many :art_request_specifications
  accepts_nested_attributes_for :art_request_specifications, allow_destroy: true, reject_if: :all_blank

  belongs_to :card_type, class_name: 'CardFamily'
  belongs_to :paper_type, class_name: 'CardPaper'
  belongs_to :art_request
end
