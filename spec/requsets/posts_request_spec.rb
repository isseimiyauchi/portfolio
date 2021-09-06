require 'rails_helper'

RSpec.describe "社内ニュース確認テスト", type: :request do
  describe "#index" do
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

  describe "#new" do
    let(:user) { create(:user) }
    let(:post) { create(:post, user: user) }
    it 'リクエストが成功すること' do
      sign_in user
      get new_post_path
      expect(response).to have_http_status(200)
    end
  end

  describe "#show" do
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

  describe '記事検索のテスト' do
    context '正しいパラメータが渡されている場合' do
      it '検索後の対象データに想定している内容があること' do
        @params = {}
        @params[:q] = { detail_cont: 'test2' }
        @q = Post.ransack(@params)
        @posts = @q.result
        expect(@posts) == ({ detail: 'test2' })
      end
    end

    context '不正なパラメータが渡されている場合' do
      it '検索後の対象データに想定している内容がないこと' do
        @params = {}
        @params[:q] = { detail_cont: 'test2' }
        @q = Post.ransack(@params)
        @posts = @q.result
        expect(@posts) != ({ detail: 'テスト２' })
      end
    end
  end
end
