MackOverflow::Application.routes.draw do

  resources :answers


  resources :questions


  resources :questionrs


  resources :users


  resources :users, except: [:index]
  resources :questions
  resources :answers, except: [:index]

<<<<<<< HEAD
 root :to => 'questions#index'
=======
  resources :users do 
    resources :questions, :only => [:show]
  end

  resources :users do 
    resources :answers, :only => [:show]
  end

 root :to => 'question#index'
>>>>>>> 2b9f9cd32c0d0bce86aac5c105d6e86a0b0f751b

end
