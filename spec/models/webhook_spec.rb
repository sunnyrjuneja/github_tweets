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

  it 'is not valid without a gh_id' do
    expect(build(:webhook, gh_id: nil)).to have(1).errors_on(:gh_id)
  end
end
