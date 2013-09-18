MackOverflow::Application.routes.draw do

  resources :users, except: [:index]
  resources :questions
  resources :answers, except: [:index]

 root :to => 'question#index'

end
