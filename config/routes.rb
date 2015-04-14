Rails.application.routes.draw do
  
  devise_for :users

  resources :lists, only: %i[index new create]
  resources :recommendations, only: %i[show]

  resources :mobile_apps, only: %i[index] do
    resources :recommendations, only: %i[index new create]
  end

  root to: "static_pages#welcome"
end
