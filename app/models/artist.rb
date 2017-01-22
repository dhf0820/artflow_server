class Artist < ApplicationRecord
  belongs to :user
  has_many :jobs
end