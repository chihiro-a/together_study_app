Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'homes/about'
  resources :study_times,only:[:new,:create,:show,:update,:edit]
  resources :recommends do
    resource :favorites, only: [:create, :destroy]
    resources :recommend_comments, only: [:create, :destroy]
  end
  resources :users,only:[:show,:edit,:update,:index]
  patch 'users/:id/start' => 'users#start' ,as:'start'
  patch 'users/:id/stop' => 'users#stop' ,as:'stop'
  resources :posts


  get 'search' => "recommends#search"

end
