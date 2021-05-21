Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'homes/about'
  resources :study_times,only:[:new,:create,:index,:update,:edit]
  resources :recommends do
    resource :favorites, only: [:create, :destroy]
    resources :recommend_comments, only: [:create, :destroy]
  end
  resources :users,only:[:show,:edit,:update]
  patch 'users/:id/start' => 'users#start' ,as:'start'
  patch 'users/:id/stop' => 'users#stop' ,as:'stop'

  get 'search' => "recommends#search"

end
