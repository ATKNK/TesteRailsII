Rails.application.routes.draw do

  devise_for :users
  root "home#show"

  get "/home", controller: "home", action: :show
  get "/dashboard", controller: "dashboard", action: :show

  resources :questions
  resources :questionnaires
  resources :question_options
  resources :users do
    resources :roles
  end

  get "up" => "rails/health#show", as: :rails_health_check

end
