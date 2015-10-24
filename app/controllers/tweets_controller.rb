class TweetsController < ApplicationController
  include TweetsHelper
  before_action :signed_in_user

  def index
    @tweets = Tweet.where(user_id: current_user.id).order(created_at: 'DESC')
    @timeline = current_user.timeline
    @user_tweets = current_user.user_tweets(current_user)
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new tweet_params
    @tweet.user_id = current_user.id
    if @tweet.save
      redirect_to tweets_path
    else
      render :new
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit :tweet_body
  end
end
