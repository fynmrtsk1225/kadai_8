Rails.application.routes.draw do
  root "users#new"
  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :sessions, only: [:new, :create, :destroy]

  resources :pictures do
    collection do
      post :confirm
    end
  end

  resources :favorites, only: [:create, :destroy, :show]

end

