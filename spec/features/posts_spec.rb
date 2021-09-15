require 'rails_helper'

RSpec.feature '記事画面確認テスト', type: :feature do
  describe '#index' do
    let(:user) { create(:user) }
    let(:post) { create(:post, user_id: user.id) }

    before do
      sign_in user
      visit posts_path
    end

    it 'リンクテスト[新規登録]' do
      click_link 'link_new_post'
      expect(page).to have_current_path new_post_path
    end
  end

  describe '#show' do
    let(:user) { create(:user) }
    let(:post) { create(:post, user_id: user.id) }

    before do
      sign_in user
      visit post_path(post.id)
    end

    it '一覧項目が表示できているか' do
      expect(page).to have_content post.title
      expect(page).to have_content post.detail
    end
  end
end
