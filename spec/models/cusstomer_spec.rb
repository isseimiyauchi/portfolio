require 'rails_helper'

RSpec.describe Customer, type: :model do
  let(:user) { create(:user) }
  let(:customer) { create(:customer, user_id: user.id) }

  # valid when the corresponded address is got with latitude and longitude
  it "is valid when appropreate latlng is received with an address" do
    Customer.geocoded_by :address
    lat = customer.latitude.to_f
    lng = customer.longitude.to_f
    expect(lat).to be_within(0.005).of 34.706705
    expect(lng).to be_within(0.005).of 135.195490
  end
end
