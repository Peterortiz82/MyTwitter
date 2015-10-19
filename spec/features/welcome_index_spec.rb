require 'rails_helper'

describe 'Welcome index' do

  before do
    visit root_path
  end

  it 'has a Sign in with Twitter button' do
    expect(page).to have_content 'Sign in with Twitter'
  end

  context 'sign in' do
    let(:user) { create :user }

    before do
      click_on 'Sign in with Twitter'
    end

    it 'redirects user to the root path and displays a success message' do
      expect(current_path).to eq root_path
      expect(page).to have_content 'You have signed in successfully!'
    end

    it 'displays the users image and a Sign Out link in the navbar' do
      expect(page).to have_content user.image
      expect(page).to have_content 'Sign Out'
    end

    it 'does not show the Sign in with Twitter button' do
      expect(page).not_to have_content 'Sign in with Twitter'
    end
  end

  context 'sign out' do
    it 'redirects user to the root path and displays a sign out notice' do
      click_on 'Sign in with Twitter'
      click_on 'Sign Out'
      expect(current_path).to eq root_path
      expect(page).to have_content 'You have signed out.'
    end
  end
end