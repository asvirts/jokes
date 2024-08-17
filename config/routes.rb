Rails.application.routes.draw do
  resources :jokes

  get "up" => "rails/health#show", as: :rails_health_check
end
