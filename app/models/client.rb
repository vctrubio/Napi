class Client < ApplicationRecord
  belongs_to :employee
  has_many :orders, dependent: :destroy
  has_many :receipts, through: :orders

  validates :rating, allow_nil: true, numericality: { only_integer: true }, inclusion: { in: [0, 1, 2, 3] }
  validates :name, presence: true

end
