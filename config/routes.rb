# frozen_string_literal: true
Rails.application.routes.draw do
  resources :notes, except: :new
  resources :images, only: :create

  root "notes#index"
end
