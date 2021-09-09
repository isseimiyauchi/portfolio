class Customer < ApplicationRecord
  validates :name, presence: true
  validates :memo, presence: true

  belongs_to :user

  geocoded_by :address
  after_validation :geocode
end
