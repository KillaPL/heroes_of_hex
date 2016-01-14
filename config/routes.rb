Rails.application.routes.draw do
  devise_for :users
 devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
 devise_scope :user do
    post '/sessions/user' => 'devise/sessions#create'
  end


  resources :sessions

  resources :rosters, only: [:create, :index, :destroy, :update, :show, :new]

  resources :rooms, only: [:create, :index] do
    post :leave
    post :join
  end

  root to: "welcome#index"
end
