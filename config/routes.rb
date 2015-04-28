Rails.application.routes.draw do


  get 'users/show'

  resources :topics do
    resources :bookmarks, except: [:index] do
      resources :likes, only: [:create, :destroy]
    end
  end

  root 'shallows#home'
  
  devise_for :users
  resources :users, only: [:show]
   
  post :incoming, to: 'incoming#create'
  
end
