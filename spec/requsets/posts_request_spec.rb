require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "GET #posts" do
    let(:user) { create(:user) }
    let(:post) { create(:post, user: user) }

    before do
      sign_in user
      get posts_path
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
    let(:post) { create(:post, user: user) }
    it 'リクエストが成功すること' do
      sign_in user
      get new_post_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #show" do
    let(:user) { create(:user) }
    let(:post) { create(:post, user: user) }
    before do
      sign_in user
      get post_path(post.id)
    end

    it 'リクエストが成功すること' do
      expect(response.status).to eq 200
    end

    it '記事詳細が表示される' do
      expect(response.body).to include(post.title)
      expect(response.body).to include(post.from)
      expect(response.body).to include(post.detail)
    end
  end
end
