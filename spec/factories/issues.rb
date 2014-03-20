# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :issue do
    title 'Build Breaks'
    html_url 'http://www.github.com/whatasunnyday/github_tweets'
  end
end
