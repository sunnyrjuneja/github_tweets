require 'spec_helper'

describe Event do
  it 'is valid with a name, action, title, number, html_url, login, and repo' do
    expect(build(:event)).to be_valid
  end

  it 'is not valid without a name' do
    expect(build(:event, name: nil)).not_to be_valid
  end

  it 'is not valid without a action' do
    expect(build(:event, action: nil)).not_to be_valid
  end

  it 'is not valid without a title' do
    expect(build(:event, title: nil)).not_to be_valid
  end

  it 'is not valid without a number' do
    expect(build(:event, number: nil)).not_to be_valid
  end

  it 'is not valid without a html_url' do
    expect(build(:event, html_url: nil)).not_to be_valid
  end

  it 'is not valid without a login' do
    expect(build(:event, login: nil)).not_to be_valid
  end

  it 'is not valid without a repository' do
    expect(build(:event, repository: nil)).not_to be_valid
  end
end
