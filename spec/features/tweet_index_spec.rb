require 'rails_helper'

describe 'Tweets index' do
  let(:user) { create :user }
  let(:other_user) { create :user }
  let(:tweet_1) { create :tweet, user: user }
  let(:tweet_2) { create :tweet, user: user }
  let(:tweet_3) { create :tweet, user: other_user }

  before {
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit tweets_path
  }

  it 'has Tweets as a title'

  it 'has a list of tweets with name, body and time'

  it 'only shows tweets from the signed in user'

  it 'has a tweet button'

end