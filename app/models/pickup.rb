class Pickup < ApplicationRecord
  belongs_to :landlord
  has_many :bags, dependent: :destroy
  has_one :total, dependent: :destroy

  after_create :set_total
  after_update :update_total

  # after_save :calculate_kg

  private

  def set_total
    total = Total.new
    total.pickup_id = self.id
    total.outflow = self.price
    total.save
  end

  # def calculate_kg
  #   if !self.kg.nil?
  #   self.kg = self.bags.sum(:kg)
  #   end
  #   if !self.price.nil?
  #     self.price = self.bags.sum(:price)
  #   end
  #   self.save
  # end

  def update_total
    self.total.outflow = self.price
    self.total.save
  end

end
