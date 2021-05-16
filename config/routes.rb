Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'homes/about'
  resources :study_times,only:[:new,:create,:index,:update,:edit]
  resources :recommends
end
