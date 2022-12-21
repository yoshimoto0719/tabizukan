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
end

# 顧客用(public)
scope module: :public do
  root to: 'homes#top'
end

end
