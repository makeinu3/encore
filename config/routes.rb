Rails.application.routes.draw do

  # 管理者
  devise_for :admins, controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    get "top" => "homes#top", as: "top"
  end

  # 顧客
  devise_for :customers, controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  scope module: :public do
    root to: "homes#top"
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
