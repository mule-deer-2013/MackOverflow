MackOverflow::Application.routes.draw do

 root :to => 'questions#index'

  resources :questions, except: [:edit]

  resources :users, except: [:index]

  resources :answers, except: [:index]

  resources :users do 
    resources :questions, :only => [:show]
  end

  resources :users do 
    resources :answers, :only => [:show]
  end



end
