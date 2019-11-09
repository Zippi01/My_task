Rails.application.routes.draw do
  devise_for :users
  authenticate :user do
    root 'tasks#index', as: :authenticated_root
    resources :tasks
    # root 'profiles#show'
    # resources :profiles
  end

  get 'show' => 'profiles#show', as: 'show'



  unauthenticated do
    root 'devise/sessions#new', as: :unauthenticated_root
  end
end
