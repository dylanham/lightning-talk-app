Rails.application.routes.draw do

  root 'welcome#index'
  resources :lightning_talks, except:[:destroy]
  get '/auth/github/callback', to: 'authentication#create'
  get '/sign-in' => 'authentication#new', as: :signin
  post '/sign-in' => 'authentication#create'
  get '/sign-out' => 'authentication#destroy', as: :signout

  resources :users, only:[:show]

  namespace :admin do
    get '', to: 'dashboard#index', as: '/'
    resources :lightning_talks
    resources :users, except:[:create, :new]
  end
end
