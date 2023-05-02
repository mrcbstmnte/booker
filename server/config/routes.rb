# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :books, only: %i[show] do
    collection do
      get '/isbn_conversion/:id', to: 'books#isbn_conversion'
    end
  end
end
