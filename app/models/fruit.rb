class Fruit < ApplicationRecord
   has_many :receipts, dependent: :destroy

   validates :name, presence: true
   validates :priceA, presence: true
   validates :priceB, presence: true
   validates :priceC, presence: true
   # delete warning
end
