Rails.application.routes.draw do
  root 'welcome#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :chapters do
    resources :events do
      get '/signup', to: 'attendance_signups#create'
      delete '/signup', to: 'attendance_signups#destroy'
    end
  end
  resources :users
end
