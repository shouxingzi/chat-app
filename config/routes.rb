# ルーティング

Rails.application.routes.draw do
  devise_for :users #devise Gemを適用すると自動生成される
  root to: "messages#index" #リンク先に/(ルートパス)を指定した場合、messagesコントローラーのindexアクションが実行される
  resources :users, only: [:edit, :update]
end
