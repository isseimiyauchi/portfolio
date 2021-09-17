require 'rails_helper'

RSpec.describe Like, type: :model do
  subject { create(:like) }
  it { is_expected.to validate_uniqueness_of(:post_id).scoped_to(:user_id) }
end
