class Snack < ApplicationRecord
  belongs_to :machine

  def self.average_price
    average(:price)
  end
end
