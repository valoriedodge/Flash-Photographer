Rails.application.routes.draw do

  devise_for :photographers
  devise_for :users

  resources :photographers, only: [:index, :show, :edit, :update]

  get 'about' => 'welcome#about'
  get 'welcome_photographers' => 'welcome#photographers'
  root 'welcome#index'

end
