Rails.application.routes.draw do

  root               'sessions#new'
  get    'signup' => 'users#new'
  post   'login'  => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  resources :users
  resources :sectors
  resources :solicitantes
  resources :objetos
  resources :objsecships
  resources :chamados
  resources :chamuserships
end
