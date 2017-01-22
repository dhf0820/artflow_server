class ProductType < ApplicationRecord
  acts_as_paranoid

  has_many :products
  has_and_belongs_to_many :art_requests
end
