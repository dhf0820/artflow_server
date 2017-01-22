class CardPrintSeq < ApplicationRecord
  acts_as_paranoid
  
  validates_uniqueness_of :name

  has_many :customer_card_backs
end
