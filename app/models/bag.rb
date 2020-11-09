class Bag < ApplicationRecord
  belongs_to :pickup, touch: true
  after_save :update_pickup
  after_update :update_pickup

  def avgprice
    self.avgprice = self.price / self.kg
  end 

  def update_pickup
    self.pickup.price += self.price
    self.pickup.kg += self.kg
    self.pickup.save
    # needs to be an array PICKUP KG;
    # HOW TO DISTINT + or -
      # << this doesnt work
  end

  def up_new

    self.pickup.price.replace()
  end


end
