Rails.application.routes.draw do

  get 'pages/index'

    root 'pages#index'


  resources :books do 
    resources :comments, :only => :create
  end
end
