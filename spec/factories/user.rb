FactoryGirl.define do
  factory :user do
    provider 'twitter'
    uid '123456'
    name 'Test User'
  end
end