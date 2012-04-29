Reviewme::Application.routes.draw do
  
  resources :reviewers

  root :to => 'reviews#pending'
  
  resources :reviews do
    collection do
        get 'pending'
        get 'done'
    end
  end

end
