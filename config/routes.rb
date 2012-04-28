Reviewme::Application.routes.draw do
  
  root :to => 'reviews#pending'
  
  resources :reviews do
    collection do
        get 'pending'
        get 'done'
    end
  end

end
