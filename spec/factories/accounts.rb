# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :account do
    user 
    provider 'twitter'
    uid '2'
    nickname 'SunnyRJuneja'
    token 'token123'
    secret 'secret123'
  end
end
