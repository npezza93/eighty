# frozen_string_literal: true
Rails.application.routes.draw do
  devise_for :users
  resources :notes, except: :new
  resources :images, only: :create

  root to: "notes#index"
end
