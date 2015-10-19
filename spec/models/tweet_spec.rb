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
    subject.tweet_body = 'a' * 141
    expect(subject).not_to be_valid
    subject.tweet_body = 'This is a valid tweet!'
    expect(subject).to be_valid
  end
end