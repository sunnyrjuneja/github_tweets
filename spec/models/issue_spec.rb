require 'spec_helper'

describe Issue do
  it 'is valid with a title and html_url' do
    expect(build(:issue)).to be_valid
  end
  
  it 'is not valid without a title' do
    expect(build(:issue, title: nil)).to have(1).errors_on(:title)
  end

  it 'is not valid without a html_url' do
    expect(build(:issue, html_url: nil)).to have(1).errors_on(:html_url)
  end
end
