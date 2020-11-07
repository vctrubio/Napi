class Payment < ApplicationRecord
    has_many :employees
    has_many :totals, dependent: :destroy

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

end
