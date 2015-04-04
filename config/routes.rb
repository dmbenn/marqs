Rails.application.routes.draw do

  devise_for :users
   root 'shallows#home'
  
end
