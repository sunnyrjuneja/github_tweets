require 'spec_helper'

describe Account do
  it 'is valid with a user, provider, uid, nickname, token, and secret' do
    expect(build(:account)).to be_valid
  end

  it 'is not valid without a user' do
    expect(build(:account, user: nil)).to have(1).errors_on(:user)
  end

  it 'is not valid without a provider' do
    expect(build(:account, provider: nil)).to have(1).errors_on(:provider)
  end

  it 'is not valid without a uid' do
    expect(build(:account, uid: nil)).to have(1).errors_on(:uid)
  end

  it 'is not valid without a nickname' do
    expect(build(:account, nickname: nil)).to have(1).errors_on(:nickname)
  end

  it 'is not valid without a token' do
    expect(build(:account, token: nil)).to have(1).errors_on(:token)
  end

  it 'is not valid without a secret' do
    expect(build(:account, secret: nil)).to have(1).errors_on(:secret)
  end
end
