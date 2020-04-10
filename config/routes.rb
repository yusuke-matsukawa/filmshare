Rails.application.routes.draw do

  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}

  devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
}

devise_scope :user do
  root :to => 'users/sessions#new'
end

get 'home/about' => 'homes#about'

resources :posts do
  resource :comments, only: [:create]
end
resources :users, only: [:show, :edit, :update]

namespace :admin do
  resources :categories, only: [:index, :create, :edit, :update, :destroy]
  resources :genres, only: [:index, :create, :edit, :update, :destroy]
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
