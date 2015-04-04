Rails.application.routes.draw do

  resources :topics

  root 'shallows#home'
  
  devise_for :users
   
  post :incoming, to: 'incoming#create'
  
end
