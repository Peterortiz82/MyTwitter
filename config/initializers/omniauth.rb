Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, Figaro.env.consumer_key, Figaro.env.consumer_secret
end