Rails.application.routes.draw do
  get 'study_times/new'
  get 'study_times/create'
  get 'study_times/index'
  get 'study_times/edit'
  root to: 'homes#top'
  get 'homes/about'
  devise_for :users
end
