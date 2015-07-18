Rails.application.routes.draw do

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  root 'static_pages#index'
  get 'help' => 'static_pages#help'
  get 'about' => 'static_pages#about'

  resources :topics, :only => [:index, :show, :new, :create]


  get '/topics/:slug/:secret_url' => 'topics#edit', as: 'edit_topic'

  put '/topics/:slug' => 'topics#update'

  delete '/topics/:slug' => 'topics#destroy', as: 'delete_topic'
  
end
