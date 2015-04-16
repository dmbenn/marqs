Rails.application.routes.draw do


  resources :topics do
    resources :bookmarks
  end

  root 'shallows#home'
  
  devise_for :users
   
  post :incoming, to: 'incoming#create'
  
end
