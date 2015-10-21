class TweetsController < ApplicationController

  def index
  end

  def new
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
