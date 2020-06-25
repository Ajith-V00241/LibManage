Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users 
  get 'books'=>'books#index', as: :books
  get '/books/thank', to: 'books#thank'
  get '/books/lend/:id' => 'books#lend', as: :lend
  get '/books/:id'=>'books#show', as: :book
  get 'searched_books', to: 'books#searchedIndex', as: :searched
  get '/books/returnBook/:id' => 'books#returnBook', as: :returnBook
  get 'lendedBooks' => 'books#lendedBooks', as: :lendedBooks

  get '/librarians/index'=>'librarians#index', as: :librarian
  get '/librarians/booksIndex'=>'librarians#booksIndex', as: :librarian_books
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end