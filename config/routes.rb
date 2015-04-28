Rails.application.routes.draw do


  resources :topics do
    resources :bookmarks, except: [:index] do
      resources :likes, only: [:create, :destroy]
    end
  end

  root 'shallows#home'
  
  devise_for :users
   
  post :incoming, to: 'incoming#create'
  
end
