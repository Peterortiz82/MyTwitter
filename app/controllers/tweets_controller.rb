class TweetsController < ApplicationController
  include TweetsHelper
  before_action :signed_in_user

  def index
    @user = current_user
    @tweets = Tweet.where(user_id: current_user.id).order(created_at: 'DESC')
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
