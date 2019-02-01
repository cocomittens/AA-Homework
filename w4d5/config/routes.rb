Rails.application.routes.draw do
  resources :users, only:[:index, :new, :create, :show]
  resources :sessions, only:[:create, :destroy, :new]
  resources :bands
  root to: redirect('users/new')
end
