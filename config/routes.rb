Rails.application.routes.draw do
  post '/login', to: 'auth#login', default: {:format => :json} 
  # Defines the root path route ("/")
  root to: 'users#index'

  scope 'api' do
    get '/posts/:id/comments' => 'api/comments#index', as: :api_post_comments
    post '/posts/:id/comments' => 'api/comments#create', as: :api_post_comments_create
    resources :users, only: [] do
      get '/posts' => 'api/posts#index', as: :api_user_posts
    end
  end 

  devise_for :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resources :comments, only: [ :new,:create, :destroy]
      resources :likes, only: [:create]
    end
  end

end
