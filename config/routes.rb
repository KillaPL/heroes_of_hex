Rails.application.routes.draw do
  resources :sessions, only: [:create, :update]

  resources :rosters, only: [:create, :index, :destroy, :update, :show, :new]

  resources :rooms, only: [:create, :index] do
    post :leave
    post :join
  end

  root to: "welcome#index"
end
