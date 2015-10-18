require 'rails_helper'

describe SessionsController do

  before do
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:twitter]
  end

  describe "#create" do

    subject { post :create, provider: :twitter }

    it "should successfully create a user"

    it "should successfully create a session"

    it "should redirect the user to the root url"

  end

  describe "#destroy" do

    subject { post :create, provider: :twitter }

    it "should clear the session"

    it "should redirect to the home page"

  end

end