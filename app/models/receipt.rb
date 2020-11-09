class Receipt < ApplicationRecord
  belongs_to :fruit
  belongs_to :order

  has_many :clients, through: :orders
  has_many :employees, through: :clients

  validates :kg, presence: true
  validates :fruit_id, presence: true

  after_save :add_order_price


  def add_order_price
    self.order.increment(:price, self.kg)
  end

  # for receipts where: r 1...5 5...10 10..100
  
  # if self.kg < 5 
  #   self.order.price = (self.fruit.priceA * self.kg)
  # elsif self.kg == 5...10
  #   self.order.price = (self.fruit.priceB * self.kg)
  # else 
  #   self.order.price = (self.fruit.priceC * self.kg)
  # end
end
