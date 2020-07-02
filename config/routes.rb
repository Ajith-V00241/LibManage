Rails.application.routes.draw do
  devise_for :admins, path: 'admins', controllers: {sessions: "admins/sessions", passwords: "admins/passwords", registrations: "admins/registrations" }
  root to: 'pages#home'
  devise_for :users 

  get 'books'=>'books#index', as: :books
  get '/books/thank', to: 'books#thank'
  get '/books/lend/:id' => 'books#lend', as: :lend
  get '/books/:id'=>'books#show', as: :book
  get 'searched_books', to: 'books#searchedIndex', as: :searched
  get '/books/returnBook/:id' => 'books#returnBook', as: :returnBook
  get 'lendedBooks' => 'books#lendedBooks', as: :lendedBooks
  get 'lendRequests' => 'books#lendRequests', as: :lendRequests
  get 'returnRequests' => 'books#returnRequests', as: :returnRequests

  get 'librarians/addBook' => 'librarians#addBook', as: :librarian_add_book
  post 'books' => 'librarians#new'
  get '/librarians/index'=>'librarians#index', as: :librarian
  get '/librarians/booksIndex'=>'librarians#booksIndex', as: :librarian_books
  get 'librarians/books/show/:id'=> 'librarians#show', as: :librarian_book
  get 'librarians/books/:id/edit'=> 'librarians#bookEdit', as: :librarian_book_edit
  patch 'books/:id' => 'librarians#bookUpdate'
  delete 'books/:id' => 'librarians#removeBook', as: :librarian_book_remove

  get 'librarians/requests/index' => 'request_admins#requestsIndex', as: :librarian_requests
  get 'librarians/requests/lendBook/all' => 'request_admins#lendRequestsAll', as: :lend_all_requests
  get 'librarians/requests/lendBook/pending' => 'request_admins#lendRequestsPending', as: :lend_pending_requests
  get 'librarians/requests/lendBook/approved' => 'request_admins#lendRequestsApproved', as: :lend_approved_requests
  get 'librarians/requests/lendBook/rejected' => 'request_admins#lendRequestsRejected', as: :lend_rejected_requests
  get 'librarians/requests/lend_requests/approve/:id' => 'request_admins#approveLendRequest', as: :approve_lend_request
  get 'librarians/requests/lend_requests/reject/:id' => 'request_admins#rejectLendRequest', as: :reject_lend_request


  get 'librarians/requests/returnBook/all' => 'request_admins#returnRequestsAll', as: :return_all_requests
  get 'librarians/requests/returnBook/pending' => 'request_admins#returnRequestsPending', as: :return_pending_requests
  get 'librarians/requests/returnBook/approved' => 'request_admins#returnRequestsApproved', as: :return_approved_requests
  get 'librarians/requests/returnBook/rejected' => 'request_admins#returnRequestsRejected', as: :return_rejected_requests
  get 'librarians/requests/return_requests/approve/:id' => 'request_admins#approveReturnRequest', as: :approve_return_request
  get 'librarians/requests/return_requests/reject/:id' => 'request_admins#rejectReturnRequest', as: :reject_return_request

  get 'librarians/user_admins/all_users'=> 'user_admins#allUsers', as: :all_users
  get 'librarians/user_admins/user/:id' => 'user_admins#showUser', as: :show_user
  delete 'users/:id' => 'user_admins#removeUser', as: :remove_user

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end