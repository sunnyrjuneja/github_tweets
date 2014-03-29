# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :repository do
    gh_id 17811642
    name 'github_tweets'
    fork false
    user 
    account
  end
end
