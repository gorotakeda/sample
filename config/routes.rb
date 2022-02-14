Rails.application.routes.draw do
  resources :blogs
  resources :articles
  resources :memos
  resources :diaries
  resources :vlogs
  resources :test_blogs
  resources :notes
  resources :books
  resources :tweets
end
