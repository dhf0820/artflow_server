class CardPaper < ApplicationRecord
  acts_as_paranoid

  has_many :jobs
end
