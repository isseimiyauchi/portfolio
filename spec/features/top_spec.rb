require 'rails_helper'

RSpec.feature "TOP", type: :feature do
  feature 'GET#/' do
    let(:user) { create(:user) }

    before do
      sign_in user
      visit root_path
    end

    it "リンクテスト[nav]" do
      click_link "home_link"
      expect(page).to have_current_path root_path

      click_link "customers_link"
      expect(page).to have_current_path customers_path

      click_link "customer_new_link"
      expect(page).to have_current_path new_customer_path

      click_link "posts_link"
      expect(page).to have_current_path posts_path
    end
  end
end
