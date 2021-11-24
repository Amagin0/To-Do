Rails.application.routes.draw do
  
  devise_for :users
  resources :lists,only: [:new,:index,:edit,:show,:create,:update,:destroy] do
    resources :items,only: [:create, :destroy]
  end
  
  
  root to: 'homes#top'

end
