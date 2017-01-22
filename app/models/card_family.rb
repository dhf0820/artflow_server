class CardFamily < ApplicationRecord
  acts_as_paranoid

  has_many :customer_card_back, foreign_key: :family_id
  has_many :card_face, foreign_key: :family_id

  def name
    "#{self.code} - #{self.side}"
  end
end
