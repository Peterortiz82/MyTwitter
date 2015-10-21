require 'rails_helper'

describe 'Tweets index' do
  let(:user) { create :user }
  let(:other_user) { create :user, name: 'Other User' }

  before {
    signed_in_user(user)
    can_post_to_twitter(user)
    visit tweets_path
  }

  it 'has Tweets as a title' do
    expect(page).to have_selector('h1', text: 'Tweets')
  end

  context 'for a user who has tweets' do
    let(:tweet) { build :tweet, user: user }
    let(:other_users_tweet) { create :tweet, user: other_user }

    subject {
      visit new_tweet_path
      fill_in 'Compose new Tweet', with: tweet.tweet_body
      click_on 'Post Tweet'
    }

    it 'has a list of tweets with name and content' do
      subject
      expect(page).to have_content tweet.user.name
      expect(page).to have_content tweet.tweet_body
    end

    it 'only shows tweets from the signed in user' do
      subject
      expect(page).not_to have_content other_users_tweet.user.name
    end
  end
end