Rails.application.routes.draw do

  root                 'sessions#new'
  get    'signup'   => 'users#new'
  get    'login'    => 'sessions#new'
  post   'login'    => 'sessions#create'
  delete 'logout'   => 'sessions#destroy'
  get 'resultado' => 'registros#resultado'
  post 'resultado' => 'registros#resultado'
  put 'updateReg'  => 'registros#updateReg'
  get 'filtro' => 'filtro#filtro'
  post 'filtro' => 'filtro#filtro'
  get 'pesquisa' => 'pesquisa#pesquisa'

  resources :users
  resources :registros
  resources :sectors
  resources :solicitantes
  resources :objetos
  resources :chamados
  resources :resolucoes
end
