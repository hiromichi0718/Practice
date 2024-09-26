Rails.application.routes.draw do
  # 投稿のリソースに対する標準的な RESTful ルーティング
  resources :posts

  # ルートページの設定（トップページとして home#index を設定）
  root "home#index"
end
