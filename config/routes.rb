Rails.application.routes.draw do

    root 'books#index'


  resources :books do 
    resources :comments, :only => :create
  end
end
