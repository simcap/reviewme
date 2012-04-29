Reviewme::Application.routes.draw do

  root :to => 'reviews#pending'
  
  resources :sessions, :only => [:new, :create, :destroy]
  
  match '/login', :to => 'sessions#new'
  match '/logout', :to => 'sessions#destroy'
  

  resources :reviewers

  resources :reviews do
    collection do
        get 'pending'
        get 'done'
    end
  end

end
