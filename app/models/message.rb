# messageモデル

class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user
  has_one_attached :image
  # has_one_attached :ファイル名
  # 各レコードとファイルを１対１の関係で紐付けるメソッド。has_one_attachedメソッドを記述したモデルの各レコードはそれぞれ１つのファイルを添付できる
  # この記述により、モデル.ファイル名 で、添付されたファイアにアクセスできるようになる。またファイル名はそのモデルが紐付いたフォーム空送られるパラメーターのキーにもなる

  validates :content, presence: true, unless: :was_attached?
  # unless メソッド名   メソッドの帰り値がfalseならバリテーションによる検証を行うことを条件としている
  # 画像が存在しなければテキストが必要となり画像があればテキストは不要になる

def was_attached?
  self.image.attached?
  # 画像があればtrueなければfalseを返す仕組みになっている
end

end

