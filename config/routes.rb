Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'
  get 'homes/about' => 'homes#about', as:'about'
  resources :study_times,only:[:new,:create,:show,:update,:edit,:destroy]
  get 'study_time/:id' => 'study_times#daily_show' ,as:'daily_show'
  resources :recommends do
    resource :favorites, only: [:create, :destroy]
    resources :recommend_comments, only: [:create, :destroy]
  end
  resources :users,only:[:show,:edit,:update,:index]
  patch 'users/:id/start' => 'users#start' ,as:'start'
  patch 'users/:id/stop' => 'users#stop' ,as:'stop'
  resources :posts do
    resources :posts_comments, only: [:create, :destroy]
  end

  post 'follow/:id' => 'relationships#create', as: 'follow' # フォローする
  delete 'unfollow/:id' => 'relationships#destroy', as: 'unfollow' # フォロー外す

  get 'follows' => 'follows#index', as:'follows'
  get 'follows/timeline' => 'follows#timeline' ,as:'timeline'

  get 'weekly' => 'rankings#ranking' ,as:'ranking'


  get 'search' => 'recommends#search'
  get 'search/rakuten' => 'recommends#rakuten_search', as:'rakuten_search'

end
