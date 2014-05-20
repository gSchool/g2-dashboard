Rails.application.routes.draw do
  root 'welcome#index'

  resources :users
  resources :projects
  get '/logout' => 'sessions#destroy', :as => 'logout'
  get '/terms' => 'terms#index', :as => 'terms'

end
