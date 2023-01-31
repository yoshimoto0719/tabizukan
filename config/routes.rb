Rails.application.routes.draw do

  # 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

# 顧客用
# URL /end_users/sign_in ...
devise_for :end_users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用(admin)
namespace :admin do
  get root to: 'homes#top'
  resources :end_users do
    member do
      get 'comments'
    end
    resources :comments, only: [:destroy]
  end
  resources :posts

end

# 顧客用(public)
scope module: :public do
  root to: 'homes#top'
  get "/homes/about" => "homes#about"
  get 'homes/show' => "homes#show"
  get 'posts/mypost' => 'posts#mypost', as: 'mypost'
  get "end_users/my_page" => "end_users#show"
  get "end_users/information" => "end_users#edit"
  get 'end_users/unsubscribe' => 'end_users#unsubscribe', as: 'unsubscribe'
  patch 'end_users/withdraw' => 'end_users#withdraw', as: 'withdraw'
  get "posts/new" => "posts#new"

  resources :end_users do
    member do
      get :favorites
    end
  end

  resources :posts do
    collection do
      get 'search'
    end
    resources :comments, only: [:create, :destroy, :index]
    resource :favorites, only: [:create, :destroy]
  end

  resources :notifications
end

end