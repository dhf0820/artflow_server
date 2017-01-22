class CardPackaging < ApplicationRecord
  acts_as_paranoid

  has_many :jobs
end
