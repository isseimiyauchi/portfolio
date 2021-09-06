require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "GET #customers" do
    let(:user) { create(:user) }
    let(:customer) { create(:customer, user_id: user.id) }

    before do
      sign_in user
      get customers_path
    end
    it 'リクエストが成功すること' do
      expect(response).to have_http_status(200)
    end

    it 'タイトルが表示されていること' do
      expect(response.body).to include "test"
    end
  end

  describe "GET #new" do
    let(:user) { create(:user) }
    let(:customer) { create(:customer, user_id: user.id) }
    it 'リクエストが成功すること' do
      sign_in user
      get new_customer_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #show" do
    let(:user) { create(:user) }
    let(:customer) { create(:customer, user_id: user.id) }

    before do
      sign_in user
      get customer_path(customer.id)
    end

    it 'リクエストが成功すること' do
      expect(response).to have_http_status(200)
    end

    it '記事詳細が表示される' do
      expect(response.body).to include(customer.name)
      expect(response.body).to include(customer.address)
      expect(response.body).to include(customer.number)
      expect(response.body).to include(customer.assets)
      expect(response.body).to include(customer.memo)
    end
  end
end
