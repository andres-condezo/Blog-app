Rails.application.routes.draw do
  devise_for :users

  post '/login', to: 'auth#login', default: {:format => :json} 
  post '/signup', to: 'auth#signup', default: {:format => :json}
  post '/logout', to: 'auth#logout', default: {:format => :json} 

  # Defines the root path route ("/")
  root to: 'users#index'

  scope 'api' do
    get 'users/:user_id/posts/:id/comments' => 'api/comments#index', as: :api_post_comments
    post 'users/:user_id/posts/:id/comments' => 'api/comments#create', as: :api_post_comments_create
    resources :users, only: [] do
      get '/posts' => 'api/posts#index', as: :api_user_posts
    end
  end 

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resources :comments, only: [ :new,:create, :destroy]
      resources :likes, only: [:create]
    end
  end

end
