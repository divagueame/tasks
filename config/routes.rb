Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :tasks do
    resources :todos, except: [:index, :show] do
      resources :details, except: [:index, :show]
    end
  end
  # Defines the root path route ("/")
  root "pages#index"
end
