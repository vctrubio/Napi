class Fruit < ApplicationRecord
   has_many :receipts, dependent: :destroy
   has_many :orders, through: :receipts

   validates :name, presence: true
   validates :priceA, presence: true
   validates :priceB, presence: true
   validates :priceC, presence: true

   # delete warning
   def fruit_contribution
      self.bags.count
   end
end
