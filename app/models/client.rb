class Client < ApplicationRecord
  belongs_to :employee
  has_many :orders, dependent: :destroy
  has_many :receipts, through: :orders

  validates :rating, allow_nil: true, numericality: { only_integer: true }, inclusion: { in: [0, 1, 2, 3] }
  validates :name, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  
  def last_order
    self.orders.last
  end

  def last_three_orders
    self.orders.last.limit(3)
  end

  def last_seven_orders
    self.orders.last.limit(7)
  end
  # ZIPCODE ADD
end
