Rails.application.routes.draw do
  resources :blogs do
    collection do
      post :confirm
      get :edit_or_destroy
    end
  end
  
  root to: 'blogs#index'
end
