Rails.application.routes.draw do

    root 'bookss#index'


  resources :books do 
    resources :comments, :only => :create
  end
end
