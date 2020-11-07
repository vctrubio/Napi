class Order < ApplicationRecord
  belongs_to :client
  has_many :receipts, dependent: :destroy
  has_many :employee, through: :clients
  has_many :totals, dependent: :destroy

 # delete warning
end
