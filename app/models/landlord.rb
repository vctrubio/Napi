class Landlord < ApplicationRecord
    has_many :pickups, dependent: :destroy
    has_many :bags, through: :pickups

    validates :name, presence: true

   # delete warning

   def kgs
    self.pickups.sum(:kg)
   end

   def paid
    self.pickups.sum(:price)
   end

   def pickup_count
    self.pickups.count
   end
end
