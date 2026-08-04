Rails.application.routes.draw do
  get "dashboard/index"
  resources :atendimentos do
    patch :cancelar, on: :member
  end
  resources :pacientes
  resources :prestadores
  resource :session
  resources :passwords, param: :token

  resource :registration, only: %i[new create]

  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"

  root "dashboard#index"
end