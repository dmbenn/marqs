Rails.application.routes.draw do

  root 'shallows#home'
  
  devise_for :users
   
  post :incoming, to: 'incoming#create'
  
end
