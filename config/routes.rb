Rails.application.routes.draw do
  
  root to: 'pages#home'
  devise_for :users 
  get '/show_user/:id' => 'pages#show_user', as: :show_user

  resources :books do 
    collection do
      get 'lend_requests'
      get 'return_requests'
      get 'lended_list'
      get 'searched_index'
      get 'thank'
    end
    get 'lend', on: :member
    get 'return', on: :member
  end

  resources :librarians do 
    get 'books', on: :collection
  end

  resources :user_admins
  resources :request_admins do
    member do
      get 'pending'
      get 'approved'
      get 'rejected'
      get 'approve_lend'
      get 'reject_lend'
      get 'approve_return'
      get 'reject_return'
    end
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end