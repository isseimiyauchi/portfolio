require 'rails_helper'

RSpec.feature "Likes", type: :feature do
  feature '#create,#destroy' do
    let(:user) { create(:user) }
    let(:post) { create(:post, user_id: user.id) }

    before do
      sign_in user
      visit post_path(post.id)
    end

    it 'ユーザーが他の投稿をいいね、解除できる' do
      find('#liking-btn').click
      expect(page).to have_selector '#nolike-btn'
      expect(post.likes.count).to eq(1)

      find('#nolike-btn').click
      expect(page).to have_selector '#liking-btn'
      expect(post.likes.count).to eq(0)
    end
  end
end
