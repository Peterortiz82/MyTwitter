require 'rails_helper'

describe 'Posting a tweet' do
  before {
    signed_in_user(user)
    can_post_to_twitter(user)
    visit new_tweet_path
  }

  describe 'new page' do
    let(:user) { create :user }
    let(:tweet) { create :tweet, user: user }

    it 'shows Compose new Tweet' do
      expect(page).to have_content 'Compose new Tweet'
    end

    it 'has a text box to enter tweet content' do
      expect(page).to have_selector :text, '#tweet_tweet_body'
    end

    describe 'Form submission' do
      context 'with no content' do
        it 'renders new and shows error message' do
          click_on 'Post Tweet'
          expect(current_path).to eq tweets_path
          expect(page).to have_content "Tweet body can't be blank"
        end
      end

      context 'when posting a tweet that is more than 140 characters' do
        it 'renders new and shows error message' do
          fill_in 'tweet_tweet_body', with: "a"*141
          click_on 'Post Tweet'
          expect(page).to have_content 'Tweet body is too long (maximum is 140 characters)'
        end
      end

      context 'with correct content' do
        before {
          fill_in 'tweet_tweet_body', with: tweet.tweet_body
          click_on 'Post Tweet'
        }

        it 'redirect you to the tweets index page and displays the tweet' do
          expect(current_path).to eq tweets_path
          expect(page).to have_content tweet.user.nickname
          expect(page).to have_content tweet.tweet_body
        end
      end
    end
  end
end