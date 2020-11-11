class Receipt < ApplicationRecord
  belongs_to :fruit
  belongs_to :order

  has_many :clients, through: :orders
  has_many :employees, through: :clients

  validates :kg, presence: true
  validates :fruit_id, presence: true

  before_save :calculate_price
  after_save :add_order_price


  def calculate_price

    if  self.kg.to_i <5 
    self.price = (self.kg*self.fruit.priceA)
    elsif self.kg.to_i >=10
    self.price = (self.kg*self.fruit.priceC)
    else 
    self.price = (self.kg*self.fruit.priceB)
    end
  end

  def add_order_price
    order = self.order
    order.save
  end

  # for receipts where: r 1...5 5...10 10..100
  
  # if self.kg < 5 
  #   self.price = (self.fruit.priceA * self.kg)
  # elsif self.kg == 5...10
  #   self.price = (self.fruit.priceB * self.kg)
  # else 
  #   self.price = (self.fruit.priceC * self.kg)
  # end
end
