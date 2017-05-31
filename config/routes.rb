Rails.application.routes.draw do
  resources :users
  resources :attractions do
    member do
      post 'ride'
    end
  end

  root 'users#index'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  delete '/signout' => 'sessions#destroy'
end
