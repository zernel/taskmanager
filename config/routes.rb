Taskmanager::Application.routes.draw do
  root :to => 'sites#index'

  resources :projects do
    resources :tasks
  end

  scope constraints: lambda { |r| r.env['warden'].user.nil? } do
    get "regist", to: "users#new", as: "regist"
    get "login", to: "sessions#new", as: "login"
  end
  delete "logout", to: "sessions#destroy", as: "logout"
  resources :users
  resources :sessions
end
