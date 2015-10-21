class TweetsController < ApplicationController
  include TweetsHelper
  before_action :signed_in_user

  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new tweet_params
    @tweet.user_id = current_user.id
    if @tweet.save
      redirect_to tweets_path, notice: 'Your tweet has been posted!'
    else
      render :new
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit :tweet_body
  end
end
