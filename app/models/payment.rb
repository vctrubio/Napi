class Payment < ApplicationRecord
    has_many :employees
    has_many :totals, dependent: :destroy

end
