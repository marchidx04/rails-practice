Rails.application.routes.draw do
  root "home#index"

  get "home/index" => "home#index"
  get "home/next" => "home#next"
end
