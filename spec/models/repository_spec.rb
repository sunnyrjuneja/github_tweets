require 'spec_helper'

describe Repository do
  it 'is valid with a user, gh_id, name, and fork' do
    expect(build(:repository)).to be_valid
  end

  it 'is not valid without a user' do
    expect(build(:repository, user: nil)).to have(1).errors_on(:user)
  end

  it 'is not valid without a gh_id' do
    expect(build(:repository, gh_id: nil)).to have(1).errors_on(:gh_id)
  end
  
  it 'is not valid without a name' do
    expect(build(:repository, name: nil)).to have(1).errors_on(:name)
  end
  
  it 'is not valid without a fork' do
    expect(build(:repository, fork: nil)).to have(1).errors_on(:fork)
  end
end
