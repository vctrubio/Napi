class Employee < ApplicationRecord
   has_many :clients, dependent: :destroy
   has_many :payments
   has_many :orders, through: :clients
   has_many :receipts, through: :orders

  # not be able to delete
  validates :name, presence: true

end


