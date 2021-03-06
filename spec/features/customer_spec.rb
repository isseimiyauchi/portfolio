require 'rails_helper'

RSpec.feature 'お客様情報表示確認テスト', type: :feature do
  describe 'GET#show' do
    let(:user) { create(:user) }
    let(:customer) { create(:customer, user_id: user.id) }

    before do
      sign_in user
      visit customer_path(customer.id)
    end

    it 'お客様情報がきちんと表示されるか' do
      expect(page).to have_content customer.name
      expect(page).to have_content customer.address
      expect(page).to have_content customer.number
      expect(page).to have_content customer.assets
      expect(page).to have_content customer.memo
    end

    it 'リンクテスト[編集]' do
      click_button '編集'
      expect(page).to have_current_path edit_customer_path(customer.id)
    end
  end
end
