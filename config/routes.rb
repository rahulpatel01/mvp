Rails.application.routes.draw do

  # get 'subjects/user:references'

  # devise_for :users,controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  devise_for :users, :controllers => {:registrations => "registrations", sessions: 'sessions', omniauth_callbacks: 'omniauth_callbacks'}
  root to: "home#index"
  resources :subjects do
    resources :ratings, only: :update
  end
  resources :donates
  resources :helps
  resources :surveys

  get 'find_course', to:'helps#find_course'
  get 'message_to_instructor', to:'helps#message_to_instructor'
  get 'video_playback', to:'helps#video_playback'
  get 'failed_purchase', to:'helps#failed_purchase'
  get 'form', to:'donates#form'
  post 'form', to:'donates#form'
  post 'invoice', to:'donates#invoice'
  get 'video', to:'home#video'
  get 'about', to:'home#about'
  get 'users/:id/educator_courses', to:'subjects#educator_courses',  :as => :educator_courses
  get 'educator_video', to:'surveys#educator_video'

  resources :settings
  get 'change_locale', to:'settings#change_locale'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
