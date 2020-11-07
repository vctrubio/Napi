class Pickup < ApplicationRecord
  belongs_to :landlord
  has_many :bags, dependent: :destroy
  has_many :totals, dependent: :destroy

  def addtotal
    self.total += self.pickup.price
  end

  def deletetotal
    self.total -= self.pickup.price
  end
end
