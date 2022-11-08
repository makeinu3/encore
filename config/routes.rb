Rails.application.routes.draw do

  # 管理者
  devise_for :admins, skip: [:registrations, :passwords] , controllers: {
    sessions: 'admin/sessions'
  }

  namespace :admin do
    get '/' => 'homes#top', as: 'top'
    resources :customers
    resources :genres, only: [:index, :create, :edit, :update]
  end

  # 顧客
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions'
  }

  scope module: :public do
    root to: 'homes#top'
    get '/welcome' => 'homes#welcome', as: 'welcome'
    get '/about' => 'homes#about', as: 'about'
    get '/thanks' => 'homes#thanks', as: 'thanks'

    resources :customers, only: [:show, :edit, :update]

    resources :posts do
      resource :likes, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
