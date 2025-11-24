Rails.application.routes.draw do

  devise_for :users
  root "home#show"

  get "/home", controller: "home", action: :show
  get "/dashboard", controller: "dashboard", action: :show

  resources :questions

  resources :questionnaires do
    resources :user_results, only: [:new, :create]
    get 'take', to: 'user_results#new', on: :member
  end

  resources :question_options

  resources :users do
    resources :roles
  end

  get "up" => "rails/health#show", as: :rails_health_check

end
