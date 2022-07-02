Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  resources :tasks do
    resources :todos, except: %i[index show] do
      resources :details, except: %i[index show]
    end
  end
  root 'pages#index'
end
