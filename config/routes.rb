Rails.application.routes.draw do

  # welcome page/root
  root 'welcome#index'

  # session controller - omniauth-twitter routes (login/logout)
  get '/auth/twitter/callback', to: 'sessions#create'
  get '/signout', to: 'sessions#destroy'

end
