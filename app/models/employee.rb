class Employee < ApplicationRecord
   has_many :clients, dependent: :destroy
   has_many :payments
   has_many :orders, through: :clients
   has_many :receipts, through: :orders

   after_save :credit


  # not be able to delete
  validates :name, presence: true

  def archive
    self.toggle! :archive
  end	

  def credit
    if !self.payments.nil?
      self.paidcash = self.payments.sum(:price)
      end
    if !self.orders.nil?

    p = self.orders.sum(:price)
      self.cash = (p*0.10)
      end

  end



end


