Taskmanager::Application.routes.draw do
  root :to => 'sites#index'

  resources :projects do
    resources :tasks, only: :index
  end
  resources :tasks, only: [:destroy, :update]

  # Back-end
  namespace :admin do
    resources :projects do
      #resources :tasks, as: :memeber
    end
  end

  # Authentication
  scope constraints: lambda { |r| r.env['warden'].user.nil? } do
    get "login", to: "sessions#new", as: :login
  end
  delete "logout", to: "sessions#destroy", as: :logout
  resources :sessions, only: :create
end
