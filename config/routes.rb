Rails.application.routes.draw do
  get 'post' => "post#index"
  get 'post/index'
  get 'post/new'
  get 'post/create'
  get 'post/show'

  root "home#index"

  get "home/index" => "home#index"
  get "home/next" => "home#next"
end
