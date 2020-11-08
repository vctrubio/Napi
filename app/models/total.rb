class Total < ApplicationRecord
    has_many :payments
    has_many :orders
    has_many :pickups

    def grossinflow
        # self.inflow.sum
    end

    def grossoutflow
        # self.outflow.sum
    end

    def grossbalance
        # self.balance.sum
    end
end
