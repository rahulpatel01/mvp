Rails.application.routes.draw do

  # get 'subjects/user:references'

  # devise_for :users,controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  devise_for :users, :controllers => {:registrations => "registrations", sessions: 'sessions', omniauth_callbacks: 'omniauth_callbacks'}
  root to: "home#dashboard_page"
  resources :subjects do
    resources :ratings, only: :update
  end
  resources :home, only: :index
  resources :donates
  resources :helps
  resources :surveys
  resources :calendars
  resources :assignments do
    resources :user_assignments
  end

  get 'dashboard_page', to:'home#dashboard_page'
  get 'educator_dashboard', to:'home#educator_dashboard'
  get 'learner_dashboard', to:'home#learner_dashboard'
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
  get 'subjects/:id/about_page', to:'subjects#about_page', :as => :about_page
  get 'all_educator', to:'home#all_educator'
  get 'assignment/:id/download_file', to:'assignments#download_file',  :as => :download_file

  resources :settings
  get 'change_locale', to:'settings#change_locale'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
