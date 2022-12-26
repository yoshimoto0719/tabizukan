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
  resources :end_users
  resources :posts
  resources :comments

end

# 顧客用(public)
scope module: :public do
  root to: 'homes#top'
  get 'home/about'
  get "end_users/my_page" => "end_users#show"
  get "end_users/information" => "end_users#edit"
  get 'end_users/unsubscribe' => 'end_users#unsubscribe', as: 'unsubscribe'
  patch 'end_users/withdraw' => 'end_users#withdraw', as: 'withdraw'
  get "posts/new" => "posts#new"

  resources :end_users

  resources :posts, only: [:new, :index, :show, :edit, :create, :update, :destroy] do
    resources :comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end

  resources :notifications
end

end
