Rails.application.routes.draw do
  devise_for :users

  resources :lists, only: %i[new create]
  resources :recommendations, only: %i[show]

  resources :mobile_apps, only: %i[index] do
    resources :recommendations, only: %i[new create index]
  end
end
