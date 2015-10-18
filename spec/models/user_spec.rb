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

require 'rails_helper'

describe User do
  subject { build :user }

  it 'responds to provider' do
    expect(subject).to respond_to(:provider)
  end

  it 'responds to uid' do
    expect(subject).to respond_to(:uid)
  end

  it 'responds to name' do
    expect(subject).to respond_to(:name)
  end

  it 'responds to location' do
    expect(subject).to respond_to(:location)
  end

  it 'responds to image' do
    expect(subject).to respond_to(:image)
  end

  it 'responds to image' do
    expect(subject).to respond_to(:description)
  end

  it 'responds to token' do
    expect(subject).to respond_to(:token)
  end

  it 'responds to secret' do
    expect(subject).to respond_to(:secret)
  end
end
