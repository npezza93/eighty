Rails.application.routes.draw do
  resources :notes, except: :new
  resources :images, only: :create
end
