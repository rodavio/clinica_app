Rails.application.routes.draw do
  resources :atendimentos
  resources :pacientes
  resources :prestadors
  resource :session
  resources :passwords, param: :token

  resource :registration, only: %i[new create]

  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"

  root "registrations#new"
end