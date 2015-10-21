require 'rails_helper'

describe 'Posting a tweet' do
  let(:user) { create :user }
  let(:tweet) { create :tweet, user: user }

  describe 'new page' do
    it 'shows Compose a new Tweet'
    it 'has a text box to enter tweet content'

    describe 'Form submission' do
      context 'with no content' do
        it 'renders new and shows error message'
      end

      context 'when posting a tweet that is more than 140 characters' do
        it 'renders new and shows error message'
      end

      context 'with correct content' do
        it 'successfully creates a tweet'
        it 'redirect you to the tweets index page and displays the tweet'
      end
    end
  end
end