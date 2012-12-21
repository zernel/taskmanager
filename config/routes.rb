Taskmanager::Application.routes.draw do
  root :to => 'sites#index'

  resources :projects do
    resources :tasks, only: :index
  end
  post 'tasks/:task_id/finish', to: 'tasks#finish', as: :finish_task
  post 'tasks/:task_id/take', to: 'tasks#take', as: :take_task
  post 'tasks/:task_id/rollback', to: 'tasks#rollback', as: :rollback_task
  post 'tasks/:task_id/checked', to: 'tasks#checked', as: :checked_task

  # Back-end
  namespace :admin do
    resources :projects
    resources :users, except: [:destroy, :show]
    resources :tasks, except: [:index]
  end

  # Authentication
  scope constraints: lambda { |r| r.env['warden'].user.nil? } do
    get "login", to: "sessions#new", as: :login
  end
  delete "logout", to: "sessions#destroy", as: :logout
  resources :sessions, only: :create
end
