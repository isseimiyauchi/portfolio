require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of(:user_name) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:password) }
  it { is_expected.to validate_presence_of(:avatar) }
  it { is_expected.to have_many(:comments) }
  it { is_expected.to have_many(:posts) }
  it { is_expected.to have_many(:liked_posts) }
  it { is_expected.to have_many(:likes) }
end
