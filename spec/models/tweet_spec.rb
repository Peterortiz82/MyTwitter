require 'rails_helper'

describe Tweet do
  subject { build :tweet }

  it 'requires a user_id' do
    subject.user_id = nil
    expect(subject).not_to be_valid
  end

  it 'requires a tweet body' do
    subject.tweet_body = nil
    expect(subject).not_to be_valid
  end

  it 'will not allow a tweet_body to exceed 140 characters' do
    subject.tweet_body = 'This tweet is more than 140 characters long and is not a valid tweet. This tweet is more than 140 characters long and is not a valid tweet.'
    expect(subject).not_to be_valid
    subject.tweet_body = 'This is a valid tweet!'
    expect(subject).to be_valid
  end
end