Rails.application.routes.draw do

  root 'welcome#index'
  match 'auth/twitter/callback', to: 'sessions#create', via: [:get, :post]

end
