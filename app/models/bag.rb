class Bag < ApplicationRecord
  belongs_to :pickup, touch: true
  after_save :avgprice

  validates :kg, presence: true
  validates :price, presence: true

  def avgprice
    self.avgprice = self.price.to_f / self.kg.to_f
  end 


end
