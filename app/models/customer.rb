class Customer < ApplicationRecord
  validates :name, presence: true
  validates :memo, presence: true

  geocoded_by :address
  after_validation :geocode
end
