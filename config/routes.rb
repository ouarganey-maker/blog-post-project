 require "resque/server"
Rails.application.routes.draw do
  get "auth/callback"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users

  resources :blog_posts 

  # Defines the root path route ("/")
  root "blog_posts#index"
  mount Resque::Server, at: "/jobs"

  get '/auth/google_oauth2/callback', to: 'auth#callback'
  get '/auth/youtube', to: redirect('/auth/google_oauth2')
end
 