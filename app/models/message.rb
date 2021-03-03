# messageモデル

class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user
  has_one_attached :image

  validates :content, presence: true
end

# has_one_attached :ファイル名
# 各レコードとファイルを１対１の関係で紐付けるメソッド。has_one_attachedメソッドを記述したモデルの各レコードはそれぞれ１つのファイルを添付できる
# この記述により、モデル.ファイル名 で、添付されたファイアにアクセスできるようになる。またファイル名はそのモデルが紐付いたフォーム空送られるパラメーターのキーにもなる
