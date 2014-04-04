# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :webhook do
    user 
    repository
    gh_id 1
  end
end
