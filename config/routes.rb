Rails.application.routes.draw do

  # welcome page/root
  root 'welcome#index'

  # session controller - omniauth-twitter routes (login/logout)
  match 'auth/twitter/callback', to: 'sessions#create', via: [:get, :post]
  match 'signout', to: 'sessions#destroy', via: [:get, :delete]

end
