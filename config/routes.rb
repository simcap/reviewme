Reviewme::Application.routes.draw do
  
  resources :reviews do
    collection do
        get 'pending'
        get 'done'
    end
  end

end
