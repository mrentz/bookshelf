Rails.application.routes.draw do

  resources :books do 
    resources :comments, :only => :create
  end
end
