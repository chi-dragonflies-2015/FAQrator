Rails.application.routes.draw do

  root 'static_pages#index'
  get 'help' => 'static_pages#help'
  get 'about' => 'static_pages#about'

  resources :topics, :only => [:index, :show, :new, :create, :update, :destroy]
  resources :questions


  get '/topics/:id/:edit_key' => 'topics#edit', as: 'edit_topic'
  
end
