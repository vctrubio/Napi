class Landlord < ApplicationRecord
    has_many :pickups, dependent: :destroy
    has_many :bags, through: :pickups

    validates :name, presence: true

   # delete warning

end
