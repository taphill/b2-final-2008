Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :doctors, only: [:show]

  namespace :doctors, only: [:show] do
    resources :patients, only: [:destroy]
  end

  # delete 'doctors/:id', to: 'doctors#destroy_patient'
  resources :hospitals, only: [:show]
end
