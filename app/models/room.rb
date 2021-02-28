# roomモデル

class Room < ApplicationRecord
  has_many :room_users
  has_many :users, through: :room_users
  has_many :messages
  validates :name, presence: true
  # name(ルーム名)が存在している場合のみ作成可という意味
end

