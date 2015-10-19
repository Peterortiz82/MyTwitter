class Tweet < ActiveRecord::Base
  validates :user_id, presence: true
  validates :tweet_body, presence: true, length: { maximum: 140 }

  belongs_to :user
end
