Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :bloggers
  resources :destinations
  resources :posts

  post '/like_post/:id', to: "posts#like_post", as: 'like_post'
end
