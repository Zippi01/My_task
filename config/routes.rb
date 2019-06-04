Rails.application.routes.draw do
  devise_for :users
  authenticate :user do
    root 'tasks#index', as: :authenticated_root
    resources :tasks
  end

  unauthenticated do
    root 'devise/sessions#new', as: :unauthenticated_root
  end
end
