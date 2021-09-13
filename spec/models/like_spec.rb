require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { create(:user) }
  let(:post) { create(:post) }
  let(:like) { create(:like, user_id: user.id) }
  describe 'バリデーションテスト' do
    it { is_expected.to validate_uniqueness_of(:user_id) }
  end
end
