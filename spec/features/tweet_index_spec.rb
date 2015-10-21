require 'rails_helper'

describe 'Tweets index' do
  let(:user) { create :user }
  let(:other_user) { create :user, name: 'Other User' }
  let!(:tweet_1) { create :tweet, user: user }
  let!(:tweet_2) { create :tweet, user: user }
  let!(:tweet_3) { create :tweet, user: other_user }

  before {
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit tweets_path
  }

  it 'has Tweets as a title' do
    expect(page).to have_selector('h1', text: 'Tweets')
  end

  it 'has a list of tweets with name and content' do
    expect(page).to have_content tweet_1.user.name
    expect(page).to have_content tweet_1.tweet_body
  end

  it 'only shows tweets from the signed in user' do
    expect(page).not_to have_content tweet_3.user.name
  end
end
