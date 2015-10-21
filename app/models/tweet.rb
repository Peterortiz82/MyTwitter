# == Schema Information
#
# Table name: tweets
#
#  id         :integer          not null, primary key
#  tweet_body :text
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tweet < ActiveRecord::Base
  before_create :post_to_twitter
  validates :user_id, presence: true
  validates :tweet_body, presence: true, length: { maximum: 140 }

  belongs_to :user

  def post_to_twitter
    user.twitter.update(tweet_body)
  end
end
