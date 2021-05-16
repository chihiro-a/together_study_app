Rails.application.routes.draw do
  root to: 'homes#top'
  get 'homes/about'
  devise_for :users
end
