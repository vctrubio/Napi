class Order < ApplicationRecord
  belongs_to :client
  has_many :receipts, dependent: :destroy
  has_and_belongs_to_many :employees, through: :clients
  has_one :total, dependent: :destroy
  has_many :fruits, through: :receipts
  
  after_create :set_total
  before_update :update_total

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
      # puts "Credit: #{self.client.employee.cash},Price: '#{self.price}' "
      # self.client.employee.cash = (self.client.employee.cash + self.price * 0.10)
      # self.client.employee.save  
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
        self.price = self.receipts.sum(:price)
        self.kg = self.receipts.sum(:kg)
        self.total.inflow = self.price
        self.total.save
      end

      def subtract_employee_credit
      end
  
      # def deleteprice
      #   self.employee.credit -= (self.price * 0.10)
      # end
  
end
