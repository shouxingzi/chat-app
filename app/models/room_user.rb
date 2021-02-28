# room_user モデル

class RoomUser < ApplicationRecord
  belongs_to :room
  belongs_to :user
end

# 一つのチャットルームには２人のユーザーが存在する、また一人のユーザーは複数のチャットルームに参加できる
# どのユーザーがどのチャットルームに参加しているかを管理するのが中間テーブルであるroom_userテーブル
