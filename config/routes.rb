Rails.application.routes.draw do

  # 管理者
  devise_for :admins, skip: [:registrations, :passwords] , controllers: {
    sessions: 'admin/sessions'
  }

  namespace :admin do
    get '/' => 'homes#top', as: 'top'
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :posts, only: [:index, :show]
    resources :messages, only: [:index, :destroy]
  end

  # 顧客
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions'
  }

  scope module: :public do
    root to: 'homes#top'
    get '/welcome' => 'homes#welcome', as: 'welcome'  # ログイン前のページ
    get '/about' => 'homes#about', as: 'about'
    get '/thanks' => 'homes#thanks', as: 'thanks'     # ログアウト後のページ

    get 'customers/my_page' => 'customers#my_page', as: 'my_page'
    get 'customers/info/edit' => 'customers#edit', as: 'edit_info'
    patch 'customers/info' => 'customers#update', as: 'update_info'
    get 'customers/unsubscribe' => 'customers#unsubscribe', as: 'confirm_unsubscribe'  # 退会確認画面
    patch 'customers/withdraw' => 'customers#withdraw', as: 'withdraw_customer'        # 退会処理
    resources :customers, only: [:show] do
      member do
        get 'likes'  # いいねした投稿一覧
      end
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end

    resources :posts do
      resources :comments, only: [:create, :destroy]
      resource :likes, only: [:create, :destroy]
    end

    resources :messages, only: [:index, :create, :destroy]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
