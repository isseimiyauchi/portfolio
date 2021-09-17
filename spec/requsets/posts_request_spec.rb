require 'rails_helper'

RSpec.describe "社内ニュース確認テスト", type: :request do
  describe "#index" do
    let(:user) { create(:user) }
    let(:post) { create(:post, user_id: user.id) }

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
    let(:post) { create(:post, user_id: user.id) }
    it 'リクエストが成功すること' do
      sign_in user
      get new_post_path
      expect(response).to have_http_status(200)
    end
  end

  describe "#show" do
    let(:user) { create(:user) }
    let(:post) { create(:post, user_id: user.id) }
    before do
      sign_in user
      get post_path(post.id)
    end

    it 'リクエストが成功すること' do
      expect(response.status).to eq 200
    end

    it '記事詳細が表示される' do
      expect(response.body).to include(post.title)
      expect(response.body).to include(post.detail)
    end
  end

  describe "POST#create" do
    let(:user) { create(:user) }
    let(:new_post) { create(:post, user_id: user.id) }
    let(:post_params) { attributes_for(:post) }
    let(:invalid_post_params) { attributes_for(:post, title: "") }

    before do
      sign_in user
    end

    context 'パラメータが妥当な場合' do
      it 'リクエストが成功すること' do
        post posts_url, params: { post: post_params }
        expect(response.status).to eq 302
      end

      it '記事が登録されること' do
        expect do
          post posts_url, params: { post: post_params }
        end.to change(Post, :count).by(1)
      end

      it 'リダイレクトすること' do
        post posts_url, params: { post: post_params }
        expect(response).to redirect_to posts_path
      end
    end

    context 'パラメータが不正な場合' do
      it 'リクエストが成功すること' do
        post posts_url, params: { post: invalid_post_params }
        expect(response.status).to eq 200
      end

      it '記事が登録されないこと' do
        expect do
          post posts_url, params: { post: invalid_post_params }
        end.to_not change(Post, :count)
      end
    end
  end

  describe '記事検索のテスト' do
    context '正しいパラメータが渡されている場合' do
      it '検索後の対象データに想定している内容があること' do
        @params = {}
        @params[:q] = { title_cont: 'test2' }
        @q = Post.ransack(@params)
        @posts = @q.result
        expect(@posts) == ({ title: 'test2' })
      end
    end

    context '不正なパラメータが渡されている場合' do
      it '検索後の対象データに想定している内容がないこと' do
        @params = {}
        @params[:q] = { title_cont: 'test2' }
        @q = Post.ransack(@params)
        @posts = @q.result
        expect(@posts) != ({ title: 'テスト２' })
      end
    end
  end
end
