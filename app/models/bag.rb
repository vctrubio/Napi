class Bag < ApplicationRecord
  belongs_to :pickup

  def avgprice
    self.avgprice = self.price / self.kg
  end 
end
