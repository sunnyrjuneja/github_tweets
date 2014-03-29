# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    provider 'github'
    uid 1108341
    nickname 'whatasunnyday'
    email 'jr.sunny@gmail.com'
    name 'Sunny Juneja'
    token 'abcd1234'
  end
end
