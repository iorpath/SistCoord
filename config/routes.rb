SistCoord::Application.routes.draw do
  resources :horarios

  resources :seccions

  resources :homologacions

  resources :pensums

  resources :homologacions

  resources :materia_tipo_pensums

  resources :tipo_pensums

  resources :materia

  resources :estudiantes


  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users, :only => [:show, :index]
end
