class CardSize < ApplicationRecord
  acts_as_paranoid

  has_many :customer_card_backs
end
