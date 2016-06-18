Rails.application.routes.draw do

  devise_for :photographers
  devise_for :users

  resources :photographers, only: [:index, :show, :edit, :update]

  resources :photographers, only: [] do
      resources :reviews, only: [:create, :destroy]

  end

  get 'about' => 'welcome#about'
  root 'welcome#index'


end
