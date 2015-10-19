# == Schema Information
#
# Table name: users
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  provider    :string
#  uid         :string
#  name        :string
#  location    :string
#  image       :string
#  description :string
#  token       :string
#  secret      :string
#

class User < ActiveRecord::Base
  has_many :tweets

  def self.find_or_create_from_auth_hash(auth_hash)
    user = where(provider: auth_hash.provider, uid: auth_hash.uid).first_or_create
    user.update name: auth_hash.info.name,
                location: auth_hash.info.location,
                image: auth_hash.info.image,
                description: auth_hash.info.description,
                token: auth_hash.credentials.token,
                secret: auth_hash.credentials.secret
    user
  end
end
