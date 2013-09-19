MackOverflow::Application.routes.draw do

  root :to => 'questions#index'  # We suggest to create a root to point to the sign in/create account page instead of having it pointing to questions#index

  resources :sessions, only: [:new, :create, :destroy]
  match '/signin', to: 'sessions#new'
  match '/signout', to: 'sessions#destroy'

  resources :questions, except: [:edit]

  resources :users, except: [:index]

  resources :answers, except: [:index]

  resources :users do 
    resources :questions, :only => [:show]
  end

  resources :users do 
    resources :answers, :only => [:show]
  end

  post '/questions/:id/answers', to: 'answers#create'


end
