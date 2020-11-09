class Bag < ApplicationRecord
  belongs_to :pickup, touch: true
  after_save :update_pickup, :avgprice
  after_update :update_pickup

  def avgprice
    self.avgprice = self.price / self.kg
  end 

end
