SistCoord::Application.routes.draw do
  resources :horarios

  resources :seccions

  resources :homologacions

  resources :pensums

  resources :homologacions

  resources :materia_tipo_pensums

  resources :tipo_pensums

  resources :materia
  
  resources :maestria

  resources :estudiantes do
    member do
      get 'menu'
    end
  end
  
  resources :maestria

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => 'home#index'
  devise_for :users
  resources :users, :only => [:show, :index]
  
  #Las maestrias isncritas por el estudiante
  match 'estudiantes/:id/maestrias' => 'estudiantes#maestrias', :as => :estudiante_maestrias
  
  #Informacion de la maestria de acuerdo al estudiante
  match 'estudiantes/:id/maestria/:id_pensum' => 'estudiantes#maestria', :as => :estudiante_maestria
end
