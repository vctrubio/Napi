class Employee < ApplicationRecord
   has_many :clients, dependent: :destroy
   has_many :payments
   has_many :orders, through: :clients
   has_many :receipts, through: :orders

  # not be able to delete
  validates :name, presence: true

  def archive
    self.toggle! :archive
  end	

  def credit
    #a method to pay the man, Payment.new(employee_id)
  end

end


