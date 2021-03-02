# ルーティング

Rails.application.routes.draw do
  devise_for :users #devise Gemを適用すると自動生成される
  root to: "rooms#index" #リンク先に/(ルートパス)を指定した場合、messagesコントローラーのindexアクションが実行される
  resources :users, only: [:edit, :update]
  resources :rooms, only: [:new, :create, :destroy] do
    resources :messages, only: [:index, :create]
    #メッセージを投稿する際には、どのルームで投稿されたメッセージなのかをパスから判断できるようにしたいので、ルーティングのネストを利用している。
    #ネストをすることによりroomsが親でmessagesが子という親子関係になるのでチャットルームに属しているメッセージという意味になる
    #これによりメッセージに結びつくルームのidの情報を含んだパスを受け取れるようになる。
  end

end

