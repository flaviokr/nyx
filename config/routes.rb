Rails.application.routes.draw do

  root               'sessions#new'
  get    'signup' => 'users#new'
  get    'login'  => 'sessions#new'
  post   'login'  => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get 'filtro' => 'chamados#filtro'
  post 'filtro' => 'chamados#filtro'
  
  resources :users
  resources :sectors
  resources :solicitantes
  resources :objetos
  resources :chamados
  resources :resolucoes
end
