class Pickup < ApplicationRecord
  belongs_to :landlord
  has_many :bags, dependent: :destroy
  has_one :total, dependent: :destroy

  after_create :set_total
  after_update :calculate_kg
  # UPDATE BECUASE CALLING FROM OTHER MODEL


  private

  def set_total
    total = Total.new
    total.pickup_id = self.id
    total.save
  end

  def calculate_kg
    if self.price.nil?
      self.price =0
    end
    if self.kg.nil?
      self.kg = 0
    end
    if !self.bags.nil?
    self.price = self.bags.sum(:price)
    self.kg = self.bags.sum(:kg)
    end
    puts "done"
    self.total.outflow = self.price
    self.total.save
    puts"YYYY"
      # price, kg from bags
  end


end
