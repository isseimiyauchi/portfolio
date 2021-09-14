require 'rails_helper'

RSpec.describe "社内ニュース確認テスト", type: :request do
  describe "GET#index" do
    it "リクエストが成功するか" do

    end
  end

  describe "GET#new" do
    it "リクエストが成功するか" do

    end
  end

  describe "GET#show" do
    it "リクエストが成功するか" do

    end
    it "記事の内容が表示できているか" do

    end
  end

  describe "POST#create" do
    context "パラメーターが妥当な場合" do
      it "リクエストが成功するか" do
      end
      it "記事が投稿できるか" do
      end
      it "リダイレクトできているか" do
      end
    end

    context "パラメーターが不正な場合" do
      it "リクエストが成功するか" do
      end
      it "記事が投稿できない" do
      end
      it "エラーメッセージを受け取っているか" do
      end
    end
  end

  describe "タイトル検索機能" do
    context "パラメーターが妥当な場合" do

    end
    context "パラメーターが不正な場合" do

    end
  end

  describe "タグ検索機能" do
    it "タグで絞り込めるか" do

    end
  end
end
