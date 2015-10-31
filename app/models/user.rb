# == Schema Information
#
# Table name: users
#
#  id                           :integer          not null, primary key
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#  provider                     :string
#  uid                          :string
#  name                         :string
#  location                     :string
#  image                        :string
#  description                  :string
#  token                        :string
#  secret                       :string
#  profile_image_url            :string
#  profile_background_image_url :string
#  nickname                     :string
#

class User < ActiveRecord::Base
  has_many :tweets

  def self.find_or_create_from_auth_hash(auth_hash)
    user = where(provider: auth_hash.provider, uid: auth_hash.uid).first_or_create
    user.update name: auth_hash.info.name,
                location: auth_hash.info.location,
                nickname: auth_hash.info.nickname,
                image: auth_hash.info.image,
                profile_image_url: auth_hash.extra.raw_info.profile_image_url.gsub('_normal', ''),
                followers_count: auth_hash.extra.raw_info.followers_count,
                friends_count: auth_hash.extra.raw_info.friends_count,
                statuses_count: auth_hash.extra.raw_info.statuses_count,
                description: auth_hash.info.description,
                token: auth_hash.credentials.token,
                secret: auth_hash.credentials.secret
    user
  end

  def twitter
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key = Figaro.env.consumer_key
      config.consumer_secret = Figaro.env.consumer_secret
      config.access_token = token
      config.access_token_secret = secret
    end
  end

  def user_tweets(user_id)
    twitter.user_timeline(user_id)
  end

  def timeline
    twitter.home_timeline
  end

end
