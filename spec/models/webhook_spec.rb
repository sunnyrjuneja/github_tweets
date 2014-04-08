require 'spec_helper'

describe Webhook do
  it 'is valid with a user, repository and gh_id' do
    expect(build(:webhook)).to be_valid
  end

  it 'is not valid without a user' do
    expect(build(:webhook, user: nil)).to have(1).errors_on(:user)
  end

  it 'is not valid without a repository' do
    expect(build(:webhook, repository: nil)).to have(1).errors_on(:repository)
  end

  describe '.active?' do
    let(:wh) { create(:webhook) }

    it 'should be active if it has a gh_id' do
      expect(wh.active?).to be_true
    end

    it 'should not be active if it does not have a gh_id' do
      wh.gh_id = nil
      expect(wh.active?).to be_false
    end
  end
end
