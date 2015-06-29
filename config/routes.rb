Rails.application.routes.draw do

  resources :professionals
  root to: "professionals#index"
end
