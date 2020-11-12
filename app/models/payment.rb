class Payment < ApplicationRecord
    has_many :employees
    has_one :total, dependent: :destroy
    has_and_belongs_to_many :employees

    after_create :set_total
    after_update :update_total

    def tickets?
        self.ticket.true
    end

    def addprice
        self.total += (self.price)
        if self.employee_id.exist?
            self.employee.credit -= self.price
        end
    end 
  
    def deleteprice
        self.total += self.price
        if self.employee_id.exist?
            self.employee.credit += self.price
        end      
    end

    private

    def set_total
      total = Total.new
      total.payment_id = self.id
      total.outflow = self.price
      total.save
    end

    def update_total
      self.total.outflow = self.price
      self.total.save
    end

end
