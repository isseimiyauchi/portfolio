require 'rails_helper'

RSpec.describe "お客様情報確認", type: :request do
  describe "#index" do
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

  describe "#new" do
    let(:user) { create(:user) }
    let(:customer) { create(:customer, user_id: user.id) }
    it 'リクエストが成功すること' do
      sign_in user
      get new_customer_path
      expect(response).to have_http_status(200)
    end
  end

  describe "#show" do
    let(:user) { create(:user) }
    let(:customer) { create(:customer, user_id: user.id) }

    before do
      sign_in user
      get customer_path(customer.id)
    end

    it 'リクエストが成功すること' do
      expect(response).to have_http_status(200)
    end

    it 'お客様情報が表示される' do
      expect(response.body).to include(customer.name)
      expect(response.body).to include(customer.address)
      expect(response.body).to include(customer.number)
      expect(response.body).to include(customer.assets)
      expect(response.body).to include(customer.memo)
    end
  end

  describe "#edit" do
    let(:user) { create(:user) }
    let(:customer) { create(:customer, user_id: user.id) }

    before do
      sign_in user
      get edit_customer_path(customer.id)
    end

    it 'リクエストが成功すること' do
      expect(response).to have_http_status(200)
    end

    it 'お客様情報が表示される' do
      expect(response.body).to include(customer.name)
      expect(response.body).to include(customer.address)
      expect(response.body).to include(customer.number)
      expect(response.body).to include(customer.assets)
      expect(response.body).to include(customer.memo)
    end
  end

  describe 'POST #create' do
    context 'パラメータが妥当な場合' do
      it 'リクエストが成功すること' do
        post customers_url, params: { customer: FactoryBot.attributes_for(:customer) }
        expect(response.status).to eq 302
      end

      it 'ユーザーが登録されること' do
        expect do
          post customers_url, params: { customer: FactoryBot.attributes_for(:customer) }
        end.to change(User, :count).by(1)
      end

      it 'リダイレクトすること' do
        post customers_url, params: { customer: FactoryBot.attributes_for(:customer) }
        expect(response).to redirect_to User.last
      end
    end

    context 'パラメータが不正な場合' do
      it 'リクエストが成功すること' do
        post customers_url, params: { customer: FactoryBot.attributes_for(:customer, :invalid) }
        expect(response.status).to eq 200
      end

      it 'ユーザーが登録されないこと' do
        expect do
          post customers_url, params: { customer: FactoryBot.attributes_for(:customer, :invalid) }
        end.to_not change(User, :count)
      end

      it 'エラーが表示されること' do
        post customers_url, params: { customer: FactoryBot.attributes_for(:customer, :invalid) }
        expect(response.body).to include 'prohibited this user from being saved'
      end
    end
  end

  describe 'お客様名検索のテスト' do
    context '正しいパラメータが渡されている場合' do
      it '検索後の対象データに想定している内容があること' do
        @params = {}
        @params[:q] = { name_cont: 'test2' }
        @q = Customer.ransack(@params)
        @customers = @q.result
        expect(@customers) == ({ name: 'test2' })
      end
    end

    context '不正なパラメータが渡されている場合' do
      it '検索後の対象データに想定している内容がないこと' do
        @params = {}
        @params[:q] = { name_cont: 'test2' }
        @q = Customer.ransack(@params)
        @customers = @q.result
        expect(@customers) != ({ name: 'テスト２' })
      end
    end
  end
end
