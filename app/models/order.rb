class Order < ApplicationRecord
  belongs_to :client
  has_many :receipts, dependent: :destroy
  has_many :employees, through: :clients
  has_many :totals, dependent: :destroy
  # belongs_to :total
  has_many :fruits, through: :receipts
  
  after_create :set_total
  after_save :on_update
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
      self.client.employee.credit += (self.price * 0.10)
      self.total.inflow += (self.price)
      self.total.inflow.save
      self.client.employee.credit.save  
    end

    def deleteprice
      self.employee.credit -= (self.price * 0.10)
      self.total.outflow -= (self.price)
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

      def on_update
        self.totals.inflow = self.price
        self.totals.inflow.save
      end

      def set_prices
        addprice
      end
  
  
 # delete warning
end
