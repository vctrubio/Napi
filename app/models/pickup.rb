class Pickup < ApplicationRecord
  belongs_to :landlord
  has_many :bags, dependent: :destroy
  has_one :total, dependent: :destroy

  after_create :set_total
  after_update :update_total

  private

  def set_total
    total = Total.new
    total.pickup_id = self.id
    total.outflow = self.price
    total.save
  end

  def update_total
    self.total.outflow = self.price
    self.total.save
    # self.landlord.fields.subtract(self.price) 
    # self.landlord.save
  end

end
