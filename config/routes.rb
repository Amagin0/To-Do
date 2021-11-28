Rails.application.routes.draw do

  get 'users/create'
  devise_for :users
  resources :users,only: [:index,:create, :destroy]
  resources :lists,only: [:new,:index,:edit,:show,:create,:update,:destroy] do
    resources :items,only: [:create, :destroy]
  end


  root to: 'homes#top'
  get 'home/about' => 'homes#about'

end
