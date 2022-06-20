Rails.application.routes.draw do
  devise_for :users
  
  resources :tasks do
    resources :todos, except: [:index, :show] do
      resources :details, except: [:index, :show]
    end
  end
  root "pages#index"
end
