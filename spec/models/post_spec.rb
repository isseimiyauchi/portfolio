require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "バリデーションテスト" do
    it 'titleが未入力の場合' do
      post = Post.new
      post.valid?
      expect(post.errors.messages[:title]).to include('を入力してください')
    end

    it 'detailが未入力の場合' do
      post = Post.new
      post.valid?
      expect(post.errors.messages[:detail]).to include('を入力してください')
    end
  end
end
