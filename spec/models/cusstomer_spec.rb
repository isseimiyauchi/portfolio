require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe "geocorder" do
    let(:user) { create(:user) }
    let(:customer) { create(:customer, user_id: user.id) }

    it "住所から緯度経度がきちんと取得できているか" do
      Customer.geocoded_by :address
      lat = customer.latitude.to_f
      lng = customer.longitude.to_f
      expect(lat).to be_within(0.005).of 34.706705
      expect(lng).to be_within(0.005).of 135.195490
    end
  end

  describe "バリデーションテスト" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:memo) }
  end
end
