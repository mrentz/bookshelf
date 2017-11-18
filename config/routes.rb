Rails.application.routes.draw do

  get 'admins/new'

  get 'pages/index'

    root 'pages#index'

    resources :admins, only: [:new, :create, :show]

    resources :admin_sessions, only: [:create, :destroy]
    
    delete '/sign_out', to: 'admin_sessions#destroy', as: :sign_out
    get '/sign_in', to: 'admin_sessions#new', as: :sign_in
    
    resources :books do 
      resources :comments, :only => :create
    end
end
