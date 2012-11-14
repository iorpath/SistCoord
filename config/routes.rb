SistCoord::Application.routes.draw do

  resources :periodos

  resources :encuesta

  resources :horarios

  resources :seccions

  resources :homologacions

  resources :pensums

  resources :homologacions

  resources :materia_tipo_pensums

  resources :tipo_pensums

  resources :materia

  resources :maestria

  resources :llenar_encuesta

  resources :estudiantes do
    resources :estudiantemateria, :only=>[:show, :index], :as=> :materia
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

  #Enviar solicitud de inscribir una nueva maestria
  match 'estudiantes/:id/maestrias/inscribir' => 'estudiantes#inscribir_maestria', :as => :estudiante_inscribir_maestria

  match 'estudiantes/:id/carpeta/' => 'estudiantes#carpeta', :as => :estudiante_carpeta

  match 'estudiantes/:id/materium/:id_materium/new/' => 'estudiantemateria#new', :as => :new_estudiante_materia
  
  match 'estudiantes/:id/planeacion/' => 'estudiantes#planeacion', :as => :estudiante_planeacion
  resources :materias_periodo, :only => [:index]

  resources :oferta_cursos
  resources :oferta_cursos_detalle
end
