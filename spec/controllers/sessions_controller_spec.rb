require 'rails_helper'

describe SessionsController do
  before {
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:twitter]
  }

  describe "#create" do
    subject { post :create }

    it "successfully create a user" do
      expect { subject }.to change(User, :count).by(1)
    end

    it "successfully create a session" do
      expect(session[:user_id]).to eq nil
      subject
      expect(session[:user_id]).not_to eq nil
    end

    it "redirect the user to the root url" do
      subject
      expect(response).to redirect_to tweets_path
    end
  end

  describe "#destroy" do
    it "clears the session" do
      post :create
      expect(session[:user_id]).not_to eq nil
      delete :destroy
      expect(session[:user_id]).to eq nil
    end

    it "redirect to the home page" do
      delete :destroy
      expect(response).to redirect_to root_path
    end
  end
end