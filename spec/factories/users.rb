# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    provider 'github'
    uid 1
    nickname 'defunkt'
    email 'defunkt@github.com'
    name 'Chris Wanstrath'
    token 'abcd1234'
  end
end
