class Receipt < ApplicationRecord
  belongs_to :fruit
  # ??dependent :destroy
  belongs_to :order
  has_many :clients, through: :orders
  has_many :employees, through: :clients

  validates :kg, presence: true
end
