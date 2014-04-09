# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    name 'IssuesEvent'
    action 'opened'
    title 'Tests Fail'
    number 1
    html_url  'https://github.com/whatasunnyday/github_tweets/issues/1'
    login 'another_user'
    repository
  end
end
