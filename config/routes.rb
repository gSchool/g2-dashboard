Rails.application.routes.draw do
  root 'welcome#index'

  resources :users
  resources :projects do
    resources :memberships
  end

  resources :projects do
    resources :events do
      get '/:page', :action => :index, :on => :collection
    end

  end

  get '/logout' => 'sessions#destroy', :as => 'logout'
  get '/login' => 'sessions#new', :as => 'login'
  post '/login' => 'sessions#create'
  get '/terms' => 'terms#index', :as => 'terms'
  get '/about' => 'about#index', :as => 'about'
  get '/settings' => 'settings#index', :as => 'settings'


  scope :api do
    resources :events, :defaults => {:format => 'json'}
  end

end
