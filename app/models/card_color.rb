class CardColor < ApplicationRecord
  acts_as_paranoid

  validates_uniqueness_of :name

  def to_rgb
    "#{(( 1 - self.c.to_f ) * 255).to_i}, #{(( 1 - self.y.to_f ) * 255).to_i}, #{(( 1 - self.m.to_f ) * 255).to_i}"
  end


end
