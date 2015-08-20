Rails.application.routes.draw do

  root               'sessions#new'
  get    'signup' => 'users#new'
  get    'login'  => 'sessions#new'
  post   'login'  => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  resources :users
  resources :sectors
  resources :solicitantes
  resources :objetos
  resources :objsecships
  resources :chamados
  resources :chamuserships
  resources :resolucoes
end
