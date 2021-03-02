# roomモデル

class Room < ApplicationRecord
  has_many :room_users, dependent: :destroy
  has_many :users, through: :room_users
  has_many :messages, dependent: :destroy
  # dependentオプション
  # 親モデルを削除した時に、親モデルと関連している子モデルに対する挙動を指定するオプション
  # destroyをすると、親モデルが削除された時それに紐付いている子モデルも一緒に削除される

  validates :name, presence: true
  # name(ルーム名)が存在している場合のみ作成可という意味
end

