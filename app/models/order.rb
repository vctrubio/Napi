class Order < ApplicationRecord
  belongs_to :client
  has_many :receipts, dependent: :destroy
  has_many :employees, through: :clients
  has_one :total, dependent: :destroy
  # belongs_to :total
  has_many :fruits, through: :receipts
  
  after_create :set_total
  after_update :update_total, :addprice

  # before_destroy :subtract_employee_credit
  # after_save :set_prices

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

    def confirmed
      #send whatsapp/sms confirmation message
    end

    def addprice
      self.kg = self.receipts.sum(:kg)
      self.price = self.receipts.sum(:price)
      # this one tricky
      self.client.employee.credit += (self.price * 0.10)
      self.client.employee.save  
    end

    def avgprice
      (self.price / self.kg)
    end

    private
      def set_total
        total = Total.new
        total.order_id = self.id
        total.inflow = self.price
        total.save
      end

      def update_total
        self.total.inflow = self.price
        self.total.save
      end

      def subtract_employee_credit
      end
  
      # def deleteprice
      #   self.employee.credit -= (self.price * 0.10)
      # end
  
end
