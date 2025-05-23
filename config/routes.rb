Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get :floors, to: "pages#floors"
  get :user_infos, to: "pages#user_infos"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :meetings, only: [:index, :new, :create, :show, :update, :edit] do
    resources :decisions, only: [:new, :create, :index]
    resources :documents, only: [:new, :create, :index, :show]
    member do
      get :show_pdf
    end
  end

  resources :decisions, only: [:show, :update, :edit] do
    member do
      post :vote
      patch :open
      patch :close
    end

    resources :documents, only: [:new, :create]
    resources :votes, only: [:create]
  end

  resources :documents, only: [:index, :show, :new, :create]

  resources :chatrooms, only: [:index, :show, :new, :create] do
    resources :chat_members, only: [:create]
    resources :messages, only: [:create]
  end
end
