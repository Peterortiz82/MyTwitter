require 'rails_helper'

describe 'Welcome index' do

  before do
    visit root_path
  end

  it 'has a Sign in with Twitter button'

  context 'sign in' do

  it 'allows a user to sign in with their twitter credentials'

  it 'redirects user to the root path and displays a success message'

  it 'displays the users name and a Sign Out link in the navbar'

  end

  context 'sign out' do

    it 'redirects user to the root path and displays a sign out notice'

  end
end