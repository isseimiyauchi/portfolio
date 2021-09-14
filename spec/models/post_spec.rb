require 'rails_helper'

RSpec.describe Post, type: :model do
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:detail) }
  it { is_expected.to have_many(:comments) }
  it { is_expected.to have_many(:likes) }
  it { is_expected.to have_many(:liked_users) }
  it { is_expected.to have_many(:commented_users) }
  it { is_expected.to have_many(:post_tags) }
  it { is_expected.to have_many(:tags) }
end
