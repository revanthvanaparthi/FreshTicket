Rails.application.routes.draw do

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'


  devise_for :agents
  resources :organisations
  resources :tickets
  resources :agents
  root "tickets#index"
  get "tickets/status/:status", to: 'tickets#tickets_status', as: 'tickets_status'
  get "tickets/organisations/:org", to: 'tickets#tickets_org', as: 'tickets_org'
  get "tickets/of/:agent", to: 'tickets#tickets_agent', as: 'tickets_agent'
  get "unassign/tickets/", to: 'tickets#unassign_tickets', as: 'unassign_tickets'
  get "premium/organisations", to: 'organisations#premium_orgs', as: 'premium_orgs'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
