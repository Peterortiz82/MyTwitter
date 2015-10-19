FactoryGirl.define do
  factory :tweet do
    tweet_body 'Test tweet!'
    user
  end
end