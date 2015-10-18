require 'rails_helper'

describe SessionsController do

  before do
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:twitter]
  end

  describe "#create" do

    subject { post :create, provider: :twitter }

    it "successfully create a user" do
      expect{ subject }.to change(User, :count).by(1)
    end

    it "successfully create a session" do
      expect(session[:user_id]).to eq nil
      subject
      expect(session[:user_id]).not_to eq nil
    end

    it "redirect the user to the root url" do
      subject
      expect(response).to redirect_to root_url
    end

  end

  describe "#destroy" do

    subject { post :create, provider: :twitter }

    it "clears the session"

    it "redirect to the home page"

  end

end