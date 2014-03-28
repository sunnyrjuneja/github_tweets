require 'spec_helper'

describe User do
  it 'is valid with a provider, uid, nickname, email, name, token, and remember_token' do
    expect(build(:user)).to be_valid
  end

  it 'is not valid without a provider' do
    expect(build(:user, provider: nil)).to have(1).errors_on(:provider)
  end

  it 'is not valid without a uid' do
    expect(build(:user, uid: nil)).to have(1).errors_on(:uid)
  end

  it 'is not valid without a nickname' do
    expect(build(:user, nickname: nil)).to have(1).errors_on(:nickname)
  end

  it 'is not valid without a name' do
    expect(build(:user, name: nil)).to have(1).errors_on(:name)
  end

  it 'is not valid without a email' do
    expect(build(:user, email: nil)).to have(1).errors_on(:email)
  end

  it 'is not valid without a token' do
    expect(build(:user, token: nil)).to have(1).errors_on(:token)
  end

  describe 'remember_token' do
    let(:user) { build(:user) }

    it 'should be blank' do
      expect(user.remember_token).to be_blank
    end

    it 'should create after save' do
      user.save
      expect(user.remember_token).not_to be_blank
    end
  end

  it 'should have accounts' do
    user = create(:user)
    expect(user).to respond_to(:accounts) 
  end
end
