class Order < ApplicationRecord
  belongs_to :client
  has_many :receipts, dependent: :destroy
  has_many :employee, through: :clients
  has_many :totals, dependent: :destroy

    def paid
    self.toggle! :paid
    end	

    def delivered
    self.toggle! :delivered
    end	
    
    def completed
    self.paid = true
    self.delivered = true
    end

    def addprice
      self.employee.credit += (self.price * .10)
      self.total.inflow += (self.price)
    end

    def deleteprice
      self.employee.credit -= (self.price * .10)
      self.total.outflow -= (self.price)
    end

 # delete warning
end
