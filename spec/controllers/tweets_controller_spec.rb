require 'rails_helper'

describe TweetsController do
  describe 'GET index' do
    before { get :index }

    it 'returns a success status' do
      expect(response).to be_success
    end

    it 'renders the index template' do
      epxect(response).to render_template(:index)
    end
  end

  describe 'GET new' do
    before { get :new }

    it 'returns a success status' do
      expect(response).to be_success
    end

    it 'renders the new template' do
      expect(response).to render_template(:new)
    end
  end

  describe 'POST create' do
    subject { post :create }

    it 'successfully creates a tweet' do
      expect { subject }.to change(Tweet, :count).by(1)
    end

    it 'redirect to tweets#index page' do
      subject
      expect(response).to redirect_to tweets_path
    end
  end
end