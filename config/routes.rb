Rails.application.routes.draw do

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  root 'static_pages#index'
  get 'help' => 'static_pages#help'
  get 'about' => 'static_pages#about'

  resources :topics, :only => [:index, :show, :new, :create, :update, :destroy]


  get '/topics/:id/:edit_key' => 'topics#edit', as: 'edit_topic'
  
end
