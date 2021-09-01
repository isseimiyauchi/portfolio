require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '#full_title' do
    subject { helper.full_title(title) }

    context '空文字が与えられた時' do
      let(:title) { '' }
      it { is_expected.to eq 'Sales support tool' }
    end

    context 'nilが与えられた時' do
      let(:title) { nil }
      it { is_expected.to eq 'Sales support tool' }
    end

    context '文字列が与えられた時' do
      let(:title) { 'sales' }
      it { is_expected.to eq 'sales - Sales support tool' }
    end
  end
end
